resource "vault_mount" "db" {
  count = var.existing_engine ? 0 : 1

  path = var.vault_mount_path
  type = "database"
}