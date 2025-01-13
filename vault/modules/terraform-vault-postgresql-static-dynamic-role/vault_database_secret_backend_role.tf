resource "vault_database_secret_backend_role" "postgres_dynamic_creds" {
  backend             = vault_mount.db.path
  name                = "postgres_dynamic_creds"
  db_name             = vault_database_secret_backend_connection.postgres.name
  creation_statements = ["CREATE ROLE \"{{name}}\" WITH LOGIN PASSWORD '{{password}}' VALID UNTIL '{{expiration}}'; GRANT editor TO \"{{name}}\";"]
  default_ttl         = 600
}
