resource "vault_mount" "postgres" {
  path = "${var.database_path}/${var.name}"
  type = "database"
}
