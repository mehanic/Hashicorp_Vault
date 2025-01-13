# request a certificate from existing PKI Secrets engine
resource "vault_pki_secret_backend_cert" "cert" {
  namespace          = var.pki_namespace
  backend            = var.backend
  name               = var.name
  common_name        = var.common_name
  ttl                = var.ttl
  format             = var.format
  private_key_format = var.private_key_format
  revoke             = true
  auto_renew         = true
}
