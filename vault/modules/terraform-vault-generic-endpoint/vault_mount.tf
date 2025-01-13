resource "vault_mount" "default" {
  path = var.db_path
  type = "database"
}
