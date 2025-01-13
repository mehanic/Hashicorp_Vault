resource "vault_database_secret_backend_role" "postgresql" {
  for_each = var.postgresql_roles # Iterate over the map of roles

  backend = var.backend
  name    = each.key # Each role name (e.g., dev, prod)
  db_name = vault_database_secret_backend_connection.postgresql.name

  creation_statements = [
    "CREATE ROLE \"{{name}}\" WITH LOGIN PASSWORD '{{password}}' VALID UNTIL '{{expiration}}';",
    format("GRANT %s ON %s TO \"{{name}}\";",
      join(", ", each.value.grants), # Grants from the map
      each.value.tables != null
      ? join(", ", each.value.tables)
      : format("ALL TABLES IN SCHEMA %s", join(", ", each.value.schemas))
    ),
  ]

  depends_on = [vault_database_secret_backend_connection.postgresql]
}