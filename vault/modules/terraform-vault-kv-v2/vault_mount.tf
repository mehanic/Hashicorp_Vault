resource "vault_mount" "main" {
  type        = "kv"
  path        = var.mount_path
  description = var.mount_description

  options = {
    version = "2"
  }
}