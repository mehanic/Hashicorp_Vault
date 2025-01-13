resource "vault_pki_secret_backend_root_cert" "this" {
  depends_on = [vault_mount.this]

  backend = vault_mount.this.path

  type        = "internal"
  common_name = vault_mount.this.description
}
