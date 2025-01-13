resource "vault_pki_secret_backend_intermediate_set_signed" "short" {
  backend     = vault_mount.pki-short.path
  certificate = vault_pki_secret_backend_root_sign_intermediate.short.certificate
}