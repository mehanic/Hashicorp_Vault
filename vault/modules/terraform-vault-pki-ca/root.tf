# mount the root CA
resource "vault_mount" "root_ca" {
    depends_on                = [ var.module_depends_on ]
    provider                  = vault
    path                      = var.root_ca_path
    type                      = "pki"
    description               = var.root_ca_description
    default_lease_ttl_seconds = var.root_ca_default_lease_ttl_seconds
    max_lease_ttl_seconds     = var.root_ca_max_ttl_seconds
}

# create backend role for the root CA
resource "vault_pki_secret_backend_role" "root_ca" {
    provider         = vault
    backend          = vault_mount.root_ca.path
    name             = var.root_ca_role_name
    allow_subdomains = true
    max_ttl          = var.root_ca_max_ttl
    key_type         = "rsa"
    key_bits         = 2048
    require_cn       = true
}

# create the root CA
resource "vault_pki_secret_backend_root_cert" "root_cert" {
    provider = vault
    backend  = vault_mount.root_ca.path
    type                  = "internal"
    common_name           = var.root_cert_common_name
    ttl                   = var.root_cert_ttl
    format                = "pem"
    private_key_format    = "der"
    key_type              = "rsa"
    key_bits              = 4096
    exclude_cn_from_sans  = true
    ou                    = var.root_ca_ou
    organization          = var.root_ca_organization
}

# Configure the cluster for the root CA
resource "vault_pki_secret_backend_config_cluster" "root_ca_cluster" {
  backend  = vault_mount.root_ca.path
  path = "${var.vault_address}/v1/${vault_mount.root_ca.path}"
  aia_path = "${var.vault_address}/v1/${vault_mount.root_ca.path}"
}

resource "vault_pki_secret_backend_config_urls" "root_ca_urls" {
  depends_on = [vault_mount.root_ca]

  backend = vault_mount.root_ca.path
  issuing_certificates = [ "${var.vault_address}/v1/${vault_mount.root_ca.path}/issuer/{{issuer_id}}/der" ]
  crl_distribution_points = [ "${var.vault_address}/v1/${vault_mount.root_ca.path}/crl/der" ]
  ocsp_servers = [ "${var.vault_address}/v1/${vault_mount.root_ca.path}/ocsp" ]
  enable_templating = true
} 

# output the root CA cert
output "root_ca_cert" {
    value = vault_pki_secret_backend_root_cert.root_cert.certificate
}