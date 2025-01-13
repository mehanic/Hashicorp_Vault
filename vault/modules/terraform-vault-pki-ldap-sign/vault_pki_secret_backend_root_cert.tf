resource "vault_pki_secret_backend_root_cert" "code_sign_root_ca" {
  depends_on = [vault_mount.pki]

  backend = vault_mount.pki.path

  type                 = "internal"
  common_name          = "Acme Corp - Code Signing Root CA"
  ttl                  = 31536000
  format               = "pem"
  private_key_format   = "der"
  key_type             = "rsa"
  key_bits             = 4096
  exclude_cn_from_sans = true
  ou                   = "Information Technology"
  organization         = "Acme Corp"
  country              = "US"
  locality             = "Seattle"
  province             = "Washington"
}