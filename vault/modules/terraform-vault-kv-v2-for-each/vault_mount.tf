resource "vault_mount" "main" {
  type        = "kv"
  path        = var.mount_path
  description = "Key-Value Secrets Engine for my app"

  options = {
    version = "2"
  }
}
