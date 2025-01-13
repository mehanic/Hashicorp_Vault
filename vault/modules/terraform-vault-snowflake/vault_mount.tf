resource "vault_mount" "db" {
  path = var.vault_db_path
  type = "database"
}
