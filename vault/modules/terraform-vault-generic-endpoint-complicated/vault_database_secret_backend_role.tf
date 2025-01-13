resource "vault_database_secret_backend_role" "readonly" {
  backend = vault_database_secret_backend_connection.this.backend
  name    = "readonly"
  db_name = vault_database_secret_backend_connection.this.name
  creation_statements = [
    "CREATE ROLE \"{{name}}\" WITH LOGIN PASSWORD '{{password}}' VALID UNTIL '{{expiration}}';",
    "GRANT CONNECT ON DATABASE ${var.database_name} TO \"{{name}}\";",
    "GRANT USAGE ON SCHEMA public TO \"{{name}}\";",
    "GRANT SELECT ON ALL TABLES IN SCHEMA public TO \"{{name}}\";",
  ]
}
