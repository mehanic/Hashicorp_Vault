# Enable the intermediate CA PKI secrets engine
resource "vault_mount" "web_issuer_ca" {
  path                      = var.web_issuer_ca_path
  type                      = "pki"
  description               = var.web_issuer_ca_description
  default_lease_ttl_seconds = 3600
  max_lease_ttl_seconds     = 43800 * 3600
}

# Create a role for issuing certificates from the intermediate CA
resource "vault_pki_secret_backend_role" "web_issuer_ca_role" {
  backend          = vault_mount.web_issuer_ca.path
  name             = var.web_issuer_ca_backend_role_name
  allow_any_name   = true
  max_ttl          = var.web_issuer_ca_max_ttl
  ttl              = var.web_issuer_ca_ttl
  no_store         = false
}

# Generate the intermediate CA CSR
resource "vault_pki_secret_backend_intermediate_cert_request" "web_issuer_ca_csr" {
  backend     = vault_mount.web_issuer_ca.path
  type        = vault_pki_secret_backend_root_cert.root_cert.type
  common_name = var.web_issuer_ca_cert_common_name
}

# Sign the intermediate CA CSR with the root CA
resource "vault_pki_secret_backend_root_sign_intermediate" "web_issuer_ca_cert" {
  backend      = vault_mount.root_ca.path
  csr          = vault_pki_secret_backend_intermediate_cert_request.web_issuer_ca_csr.csr
  common_name  = var.web_issuer_ca_cert_common_name
  format       = "pem_bundle"
  ttl          = "43800h"
}

# Set the signed intermediate certificate
resource "vault_pki_secret_backend_intermediate_set_signed" "web_issuer_ca_cert" {
  backend     = vault_mount.web_issuer_ca.path
  certificate = vault_pki_secret_backend_root_sign_intermediate.web_issuer_ca_cert.certificate
}

# Configure the cluster for the intermediate CA
resource "vault_pki_secret_backend_config_cluster" "web_issuer_ca_cluster" {
  backend  = vault_mount.web_issuer_ca.path
  path = "${var.vault_address}/v1/${vault_mount.web_issuer_ca.path}"
  aia_path = "${var.vault_address}/v1/${vault_mount.web_issuer_ca.path}"
}


# Configure URLs for the intermediate CA
resource "vault_pki_secret_backend_config_urls" "web_issuer_ca_urls" {
  depends_on = [vault_mount.root_ca]

  backend = vault_mount.root_ca.path
  issuing_certificates = [ "${var.vault_address}/v1/pki/issuer/{{issuer_id}}/der" ]
  crl_distribution_points = [ "${var.vault_address}/v1/${vault_mount.web_issuer_ca.path}/crl/der" ]
  ocsp_servers = [ "${var.vault_address}/v1/${vault_mount.web_issuer_ca.path}/ocsp" ]
  enable_templating = true
} 

# Tune the intermediate CA for ACME capabilities
resource "vault_generic_endpoint" "pki_int_tune" {
  path = "sys/mounts/${vault_mount.web_issuer_ca.path}/tune"
  data_json = jsonencode({
    passthrough_request_headers = ["If-Modified-Since"]
    allowed_response_headers    = ["Last-Modified", "Location", "Replay-Nonce", "Link"]
  })
  disable_delete = true
}

# Enable ACME on the intermediate CA
resource "vault_generic_endpoint" "web_issuer_ca_acme" {
  path = "${vault_mount.web_issuer_ca.path}/config/acme"
  data_json = jsonencode({
    enabled = true
  })
  disable_delete = true

}


# Output the intermediate CA certificate
output "web_issuer_ca_cert" {
  value = vault_pki_secret_backend_intermediate_set_signed.web_issuer_ca_cert.certificate
}

# Output the intermediate CA mount path
output "web_issuer_ca_mount_path" {
  value = vault_mount.web_issuer_ca.path
}

# Output the intermediate CA backend role name
output "web_issuer_ca_backend_role_name" {
  value = vault_pki_secret_backend_role.web_issuer_ca_role.name
}