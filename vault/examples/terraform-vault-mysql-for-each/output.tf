output "devbox_mysql_connection_name" {
  description = "Name of the MySQL database connection in Vault"
  value       = module.terraform-vault-mysql-for-each.devbox_mysql_connection_name
}

output "db_roles_names" {
  description = "List of database roles created in Vault"
  value       = module.terraform-vault-mysql-for-each.db_roles_names
}

output "db_roles_default_ttl" {
  description = "List of default TTL values for each role"
  value       = module.terraform-vault-mysql-for-each.db_roles_default_ttl
}

output "db_roles_max_ttl" {
  description = "List of max TTL values for each role"
  value       = module.terraform-vault-mysql-for-each.db_roles_max_ttl
}

output "db_roles_creation_statements" {
  description = "Creation statements used for each role"
  value       = module.terraform-vault-mysql-for-each.db_roles_creation_statements
}

output "db_roles_policies" {
  description = "Policies associated with each database role"
  value       = module.terraform-vault-mysql-for-each.db_roles_policies
}
