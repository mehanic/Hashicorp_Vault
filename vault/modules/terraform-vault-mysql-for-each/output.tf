output "devbox_mysql_connection_name" {
  description = "Name of the MySQL database connection in Vault"
  value       = vault_database_secret_backend_connection.devbox_mysql.name
}

output "db_roles_names" {
  description = "List of database roles created in Vault"
  value       = [for role in vault_database_secret_backend_role.db_roles : role.name]
}

output "db_roles_default_ttl" {
  description = "List of default TTL values for each role"
  value       = { for role in vault_database_secret_backend_role.db_roles : role.name => role.default_ttl }
}

output "db_roles_max_ttl" {
  description = "List of max TTL values for each role"
  value       = { for role in vault_database_secret_backend_role.db_roles : role.name => role.max_ttl }
}

output "db_roles_creation_statements" {
  description = "Creation statements used for each role"
  value       = { for role in vault_database_secret_backend_role.db_roles : role.name => role.creation_statements }
}

output "db_roles_policies" {
  description = "Policies associated with each database role"
  value       = { for policy in vault_policy.db_roles : policy.name => policy.policy }
}
