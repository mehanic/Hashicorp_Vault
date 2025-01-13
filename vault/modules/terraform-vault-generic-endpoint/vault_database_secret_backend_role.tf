resource "vault_database_secret_backend_role" "default" {
  backend             = vault_mount.default.path
  name                = var.db_backend_role_name
  db_name             = vault_database_secret_backend_connection.default.name
  creation_statements = ["CREATE ROLE \"{{name}}\" WITH LOGIN PASSWORD '{{password}}' VALID UNTIL '{{expiration}}';"]
}
