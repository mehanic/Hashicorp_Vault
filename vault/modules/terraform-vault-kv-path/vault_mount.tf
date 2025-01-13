resource "vault_mount" "kv" {
  path        = var.kv_path
  type        = "kv"
  description = "kv secret engine managed by Terraform"
}
