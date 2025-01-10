# Output the MySQL user name
output "mysql_user_name" {
  description = "The name of the MySQL user"
  value       = module.terraform-vault-mysql-rotate-root.mysql_user_name
}

# Output the MySQL user host
output "mysql_user_host" {
  description = "The host of the MySQL user"
  value       = module.terraform-vault-mysql-rotate-root.mysql_user_host
}

# Output the MySQL user password (sensitive)
output "mysql_user_password" {
  description = "The password of the MySQL user"
  value       = module.terraform-vault-mysql-rotate-root.mysql_user_password
  sensitive   = true
}

# Output the MySQL grant details for each database
output "mysql_grant_privileges" {
  description = "The granted privileges for the MySQL user"
  value       = module.terraform-vault-mysql-rotate-root.mysql_grant_privileges
}

# Output the Vault database connection URL
output "vault_database_connection_url" {
  description = "The connection URL for the Vault database backend"
  value       = module.terraform-vault-mysql-rotate-root.vault_database_connection_url
}

# Output the Vault database username
output "vault_database_username" {
  description = "The username for the Vault database backend"
  value       = module.terraform-vault-mysql-rotate-root.vault_database_username
}

# Output the Vault database password (sensitive)
output "vault_database_password" {
  description = "The password for the Vault database backend"
  value       = module.terraform-vault-mysql-rotate-root.vault_database_password
  sensitive   = true
}

# Output the Vault rotation path for root credentials
output "vault_rotation_path" {
  description = "The path to rotate root credentials in Vault"
  value       = module.terraform-vault-mysql-rotate-root.vault_rotation_path
}
