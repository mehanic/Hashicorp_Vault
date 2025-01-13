resource "vault_mount" "database" {
  path                      = var.path
  type                      = "database"
  description               = var.description
  default_lease_ttl_seconds = var.default_lease_ttl_seconds
  max_lease_ttl_seconds     = var.max_lease_ttl_seconds
} # can comment "vault_mount" "database" and execute in exist too


# resource "vault_database_secret_backend_connection" "postgresql" {
#   backend       = var.backend
#   name          = var.database_name
#   allowed_roles = var.postgresql_roles

#   postgresql {
#     connection_url = var.postgresql_connection_url
#   }
# }

# resource "vault_database_secret_backend_role" "postgresql" {
#   for_each = var.postgresql_roles
#   backend  = var.backend
#   name     = each.key
#   db_name  = vault_database_secret_backend_connection.postgresql.name

#   creation_statements = [
#     "CREATE ROLE \"{{name}}\" WITH LOGIN PASSWORD '{{password}}' VALID UNTIL '{{expiration}}';",
#     format("GRANT %s ON %s TO \"{{name}}\";",
#       join(", ", each.value.grants),
#       each.value.tables != null 
#         ? join(", ", each.value.tables)
#         : format("ALL TABLES IN SCHEMA %s", join(", ", each.value.schemas))
#     ),
#   ]

#   depends_on = [vault_database_secret_backend_connection.postgresql]
# }

