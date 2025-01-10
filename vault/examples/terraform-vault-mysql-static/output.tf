output "vault_mount_mysql_path" {
  description = "Path for the Vault MySQL database secret engine mount"
  value       = module.terraform-vault-mysql-static.vault_mount_mysql_path
}

output "vault_database_connection_name" {
  description = "The name of the Vault database connection"
  value       = module.terraform-vault-mysql-static.vault_database_connection_name
}

output "vault_database_dynamic_creds_role" {
  description = "The name of the dynamic credentials role for the MySQL backend"
  value       = module.terraform-vault-mysql-static.vault_database_dynamic_creds_role
}

output "vault_database_static_role" {
  description = "The name of the static role for the MySQL backend"
  value       = module.terraform-vault-mysql-static.vault_database_static_role
}

output "vault_dynamic_creds_creation_statements" {
  description = "Creation statements for dynamic credentials role"
  value       = module.terraform-vault-mysql-static.vault_dynamic_creds_creation_statements
}

output "vault_static_role_rotation_statements" {
  description = "Rotation statements for static role"
  value       = module.terraform-vault-mysql-static.vault_static_role_rotation_statements
}
