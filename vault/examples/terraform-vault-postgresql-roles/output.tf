# Output the PostgreSQL connection details
output "postgresql_connection_url" {
  description = "The connection URL used for connecting to the PostgreSQL database."
  value       = module.terraform-vault-postgresql-roles.postgresql_connection_url
}

# Output the allowed roles
output "allowed_roles" {
  description = "The allowed roles for the PostgreSQL database connection."
  value       = module.terraform-vault-postgresql-roles.allowed_roles
}

# Output the list of roles created in Vault
output "postgresql_roles" {
  description = "The roles created for PostgreSQL in Vault."
  value       = module.terraform-vault-postgresql-roles.postgresql_roles
}

# Output the database name
output "database_name" {
  description = "The logical name of the database."
  value       = module.terraform-vault-postgresql-roles.database_name
}

# Output the database backend path
output "vault_backend_path" {
  description = "The path of the Vault backend used for the PostgreSQL connection."
  value       = module.terraform-vault-postgresql-roles.vault_backend_path
}
