resource "vault_mount" "db" {
  path = "postgres"
  type = "database"
}

resource "vault_database_secret_backend_connection" "postgres" {
  backend       = vault_mount.db.path
  plugin_name   = "postgresql-database-plugin"
  name          = "postgres"
  allowed_roles = ["postgres_dynamic_creds", "postgres_static_role"]

  postgresql {
    connection_url    = "postgres://${var.db_username}:${var.db_password}@${var.db_host}:5432/postgres"
    username          = var.db_username
    password          = var.db_password
    username_template = "vault-psql-{{random 3}}"
  }
}

resource "vault_database_secret_backend_role" "postgres_dynamic_creds" {
  backend             = vault_mount.db.path
  name                = "postgres_dynamic_creds"
  db_name             = vault_database_secret_backend_connection.postgres.name
  creation_statements = ["CREATE ROLE \"{{name}}\" WITH LOGIN PASSWORD '{{password}}' VALID UNTIL '{{expiration}}'; GRANT postgres TO \"{{name}}\";"]
  default_ttl         = 600
}

resource "vault_database_secret_backend_static_role" "postgres_static_role" {
  backend             = vault_mount.db.path
  name                = "postgres_static_role"
  db_name             = vault_database_secret_backend_connection.postgres.name
  username            = var.db_user_static
  rotation_period     = 600
  rotation_statements = ["ALTER USER \"{{name}}\" WITH PASSWORD '{{password}}';"]
}