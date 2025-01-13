resource "vault_auth_backend" "approle" {
  depends_on = [var.module_depends_on]
  type       = "approle"
  path       = var.approle_auth_mount_path
}