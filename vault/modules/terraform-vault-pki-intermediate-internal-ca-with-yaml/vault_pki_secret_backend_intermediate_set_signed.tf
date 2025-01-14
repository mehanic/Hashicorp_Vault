# Add certificate to mount
resource "vault_pki_secret_backend_intermediate_set_signed" "this" {
  backend     = vault_mount.this.path
  certificate = vault_pki_secret_backend_root_sign_intermediate.this.certificate
}
