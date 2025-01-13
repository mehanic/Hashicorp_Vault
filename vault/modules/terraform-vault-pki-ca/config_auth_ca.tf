# mount the intermediate CA
resource "vault_mount" "config_inter_ca" {
    provider                  = vault
    path                      = var.conf_auth_ca_path
    type                      = "pki"
    description               = var.conf_auth_ca_description
    default_lease_ttl_seconds = var.conf_auth_ca_default_lease_ttl_seconds
    max_lease_ttl_seconds     = var.conf_auth_ca_max_ttl_seconds
}

# create backend role for the intermediate CA
resource "vault_pki_secret_backend_role" "config_inter_ca" {
    provider           = vault
    backend            = vault_mount.config_inter_ca.path
    name               = var.conf_auth_ca_backend_role_name
    allow_subdomains   = true
    max_ttl            = var.conf_auth_ca_max_ttl
    ttl                = var.conf_auth_ca_ttl
    key_type           = "rsa"
    key_bits           = 2048
    require_cn         = true
    allow_any_name     = false 
    enforce_hostnames  = false 
    allowed_domains    = var.vault_allowed_domains
    allow_bare_domains = true
}

# create the intermediate CA
resource "vault_pki_secret_backend_intermediate_cert_request" "config_inter_ca_csr" {
    backend     = vault_mount.config_inter_ca.path
    type        = vault_pki_secret_backend_root_cert.root_cert.type
    common_name = var.conf_auth_ca_cert_common_name
}

# sign the intermediate CA
resource "vault_pki_secret_backend_root_sign_intermediate" "config_inter_ca_cert" {
    backend              = vault_mount.root_ca.path
    csr                  = vault_pki_secret_backend_intermediate_cert_request.config_inter_ca_csr.csr
    common_name          = var.conf_auth_ca_cert_common_name
    exclude_cn_from_sans = true
    ou                   = var.conf_auth_ca_cert_ou
    organization         = var.conf_auth_ca_cert_organization
    country              = var.conf_auth_ca_cert_country
    locality             = var.conf_auth_ca_cert_locality
    revoke               = true
}

# set the signed intermediate CA
resource "vault_pki_secret_backend_intermediate_set_signed" "config_inter_ca_cert" {
    backend     = vault_mount.config_inter_ca.path
    certificate = vault_pki_secret_backend_root_sign_intermediate.config_inter_ca_cert.certificate
}

# output the intermediate CA cert
output "conf_auth_ca_cert" {
    value = vault_pki_secret_backend_intermediate_set_signed.config_inter_ca_cert.certificate
}

# output the intermediate CA mount path
output "conf_auth_ca_mount_path" {
    value = vault_mount.config_inter_ca.path
}

# output the intermediate CA backend role name
output "conf_auth_ca_backend_role_name" {
    value = vault_pki_secret_backend_role.config_inter_ca.name
}
