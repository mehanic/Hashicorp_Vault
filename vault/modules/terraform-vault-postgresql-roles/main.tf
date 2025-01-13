# resource "vault_mount" "database" {
#   path                      = var.path
#   type                      = "database"
#   description               = var.description
#   default_lease_ttl_seconds = var.default_lease_ttl_seconds
#   max_lease_ttl_seconds     = var.max_lease_ttl_seconds
# } # can comment "vault_mount" "database" and execute in exist too


# # resource "vault_database_secret_backend_connection" "postgresql" {
# #   backend       = var.backend
# #   name          = var.database_name
# #   allowed_roles = var.postgresql_roles

# #   postgresql {
# #     connection_url = var.postgresql_connection_url
# #   }
# # }

# # resource "vault_database_secret_backend_role" "postgresql" {
# #   for_each = var.postgresql_roles
# #   backend  = var.backend
# #   name     = each.key
# #   db_name  = vault_database_secret_backend_connection.postgresql.name

# #   creation_statements = [
# #     "CREATE ROLE \"{{name}}\" WITH LOGIN PASSWORD '{{password}}' VALID UNTIL '{{expiration}}';",
# #     format("GRANT %s ON %s TO \"{{name}}\";",
# #       join(", ", each.value.grants),
# #       each.value.tables != null 
# #         ? join(", ", each.value.tables)
# #         : format("ALL TABLES IN SCHEMA %s", join(", ", each.value.schemas))
# #     ),
# #   ]

# #   depends_on = [vault_database_secret_backend_connection.postgresql]
# # }



# # Vault Database Secret Backend Connection (Use keys from roles map for allowed_roles)
# resource "vault_database_secret_backend_connection" "postgresql" {
#   backend       = var.backend
#   name          = var.database_name
#   allowed_roles = keys(var.postgresql_roles) # Extract role names

#   postgresql {
#     // connection_url = var.postgresql_connection_url

#     // postgresql {
#     connection_url          = "postgres://${var.db_username}:${var.db_password}@${var.db_host}:${var.db_port}/${var.db_name}?sslmode=${var.ssl_mode}"
#     max_open_connections    = var.max_open_connections
#     max_idle_connections    = var.max_idle_connections
#     max_connection_lifetime = var.max_connection_lifetime
#     //depends_on = [vault_mount.database]
#   }
# }

# # Vault Database Secret Backend Role (Use the map of roles)
# resource "vault_database_secret_backend_role" "postgresql" {
#   for_each = var.postgresql_roles # Iterate over the map of roles

#   backend = var.backend
#   name    = each.key # Each role name (e.g., dev, prod)
#   db_name = vault_database_secret_backend_connection.postgresql.name

#   creation_statements = [
#     "CREATE ROLE \"{{name}}\" WITH LOGIN PASSWORD '{{password}}' VALID UNTIL '{{expiration}}';",
#     format("GRANT %s ON %s TO \"{{name}}\";",
#       join(", ", each.value.grants), # Grants from the map
#       each.value.tables != null
#       ? join(", ", each.value.tables)
#       : format("ALL TABLES IN SCHEMA %s", join(", ", each.value.schemas))
#     ),
#   ]

#   depends_on = [vault_database_secret_backend_connection.postgresql]
# }