resource "vault_database_secret_backend_role" "demo_role" {
  backend             = vault_mount.db.path
  name                = var.vault_db_role
  db_name             = vault_database_secret_backend_connection.snowflake.name
  creation_statements = var.vault_db_role_creation_statements
  default_ttl         = var.default_ttl
  max_ttl             = var.max_ttl
}