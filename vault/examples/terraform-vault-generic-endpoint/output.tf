output "vault_database_backend_path" {
  description = "Path to the Vault database secrets engine"
  value       = module.terraform-vault-generic-endpoint.vault_database_backend_path
}
output "vault_database_backend_role_name" {
  description = "Name of the Vault database role"
  value       = module.terraform-vault-generic-endpoint.vault_database_backend_role_name
}

output "vault_database_backend_connection_name" {
  description = "Name of the Vault database connection"
  value       = module.terraform-vault-generic-endpoint
}

output "vault_connection_url" {
  description = "The PostgreSQL connection URL used in the Vault database connection"
  value       = module.terraform-vault-generic-endpoint.vault_database_backend_connection_name
  sensitive   = true # Marked as sensitive to avoid exposing connection details
}

output "vault_rotate_initial_db_password_path" {
  description = "The path for rotating the initial DB password in Vault"
  value       = module.terraform-vault-generic-endpoint.vault_rotate_initial_db_password_path
}
