resource "vault_database_secret_backend_connection" "snowflake" {
  backend       = vault_mount.db.path
  name          = "snowflake"
  allowed_roles = [var.vault_db_role]

  snowflake {
    connection_url = var.snowflake_connection_url
    username       = snowflake_user.user.name
    password       = snowflake_user.user.password
  }
}
