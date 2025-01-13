resource "vault_pki_secret_backend_root_cert" "root-ca" {
  backend              = vault_mount.pki-root.path
  type                 = "internal"
  common_name          = "mcdevops.dev"
  ttl                  = local.default_1y_in_sec
  format               = "pem"
  private_key_format   = "der"
  key_type             = "rsa"
  key_bits             = 4096
  exclude_cn_from_sans = true
  ou                   = "DevOps"
  organization         = "McDonald-Devops"
}
