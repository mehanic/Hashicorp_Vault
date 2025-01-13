resource "vault_auth_backend" "approle" {
  type        = "approle"
  path        = var.backend_paths["approle"]
  description = "AppRole Authentication Backend"
}
