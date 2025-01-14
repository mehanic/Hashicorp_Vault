
# Create a role that can be used to request certificate signing
resource "vault_pki_secret_backend_role" "this" {
  backend = vault_mount.this.path
  name    = "${var.mesh_name}-dataplane-proxies" // it unite with root name
  allowed_uri_sans = [
    "spiffe://default/*",
    "kuma://*"
  ]
  key_usage = [
    "KeyUsageKeyEncipherment",
    "KeyUsageKeyAgreement",
    "KeyUsageDigitalSignature"
  ]
  ext_key_usage = [
    "ExtKeyUsageServerAuth",
    "ExtKeyUsageClientAuth"
  ]
  client_flag                        = true
  require_cn                         = false
  allowed_domains                    = ["mesh"]
  allow_subdomains                   = true
  basic_constraints_valid_for_non_ca = true
  max_ttl                            = var.maximum_certificate_ttl
  ttl                                = var.default_certificate_ttl
}
