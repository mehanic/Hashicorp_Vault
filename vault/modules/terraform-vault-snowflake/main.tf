# vault snowflake user
resource "random_password" "password" {
  length = 13
}

resource "snowflake_user" "user" {
  name              = var.snowflake_username
  password          = random_password.password.result
  default_role      = var.role_name
  default_warehouse = "COMPUTE_WH"
}

resource "snowflake_role_grants" "grants" {
  role_name = var.role_name
  users     = [snowflake_user.user.name]
}

resource "vault_mount" "db" {
  path = var.vault_db_path
  type = "database"
}

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

resource "vault_database_secret_backend_role" "demo_role" {
  backend             = vault_mount.db.path
  name                = var.vault_db_role
  db_name             = vault_database_secret_backend_connection.snowflake.name
  creation_statements = var.vault_db_role_creation_statements
  default_ttl         = var.default_ttl
  max_ttl             = var.max_ttl
}