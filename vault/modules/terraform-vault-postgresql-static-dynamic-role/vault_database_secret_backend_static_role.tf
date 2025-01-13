resource "vault_database_secret_backend_static_role" "postgres_static_role" {
  backend             = vault_mount.db.path
  name                = "postgres_static_role"
  db_name             = vault_database_secret_backend_connection.postgres.name
  username            = var.db_user_static
  rotation_period     = 600
  rotation_statements = ["ALTER USER \"{{name}}\" WITH PASSWORD '{{password}}';"]
}