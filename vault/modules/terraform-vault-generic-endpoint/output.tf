output "vault_database_backend_path" {
  description = "Path to the Vault database secrets engine"
  value       = vault_mount.default.path
}

output "vault_database_backend_role_name" {
  description = "Name of the Vault database role"
  value       = vault_database_secret_backend_role.default.name
}

output "vault_database_backend_connection_name" {
  description = "Name of the Vault database connection"
  value       = vault_database_secret_backend_connection.default.name
}

output "vault_connection_url" {
  description = "The PostgreSQL connection URL used in the Vault database connection"
  value       = vault_database_secret_backend_connection.default.postgresql[0].connection_url
  sensitive   = true # Marked as sensitive to avoid exposing connection details
}

output "vault_rotate_initial_db_password_path" {
  description = "The path for rotating the initial DB password in Vault"
  value       = vault_generic_endpoint.rotate_initial_db_password.path
}
