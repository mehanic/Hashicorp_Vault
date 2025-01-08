# Output for PostgreSQL role name
output "postgresql_role_name" {
  description = "Name of the PostgreSQL role created"
  value       = postgresql_role.my_role.name
}

# Output for PostgreSQL role password
output "postgresql_role_password" {
  description = "Password of the PostgreSQL role created"
  value       = postgresql_role.my_role.password
  sensitive   = true # Marked as sensitive to avoid printing in plaintext
}

# Output for Vault database secret backend connection name
output "vault_database_secret_backend_connection_name" {
  description = "Name of the Vault database connection"
  value       = vault_database_secret_backend_connection.postgres.name
}

# Output for Vault allowed roles
output "vault_allowed_roles" {
  description = "List of allowed roles for the Vault database connection"
  value       = vault_database_secret_backend_connection.postgres.allowed_roles
}

# Output for Vault database backend path
output "vault_database_backend_path" {
  description = "Path of the Vault database secret backend"
  value       = vault_database_secret_backend_connection.postgres.backend
}

# Output for connection URL (for reference)
# Output for connection URL (for reference)
output "vault_connection_url" {
  description = "PostgreSQL connection URL used by Vault"
  value       = vault_database_secret_backend_connection.postgres.postgresql[0].connection_url
  sensitive   = true # Marked as sensitive to avoid exposing connection details
}


//



# Output for Vault backend path
output "vault_backend_path" {
  description = "The backend path used by Vault for the database connection"
  value       = vault_database_secret_backend_connection.postgres.backend
}

# Output for Vault database connection name
output "vault_connection_name" {
  description = "The name of the Vault database connection"
  value       = vault_database_secret_backend_connection.postgres.name
}

# Output to indicate the root credential rotation endpoint
output "vault_rotate_root_endpoint" {
  description = "The endpoint for rotating the root credentials in Vault"
  value       = "${vault_database_secret_backend_connection.postgres.backend}/rotate-root/${vault_database_secret_backend_connection.postgres.name}"
}
