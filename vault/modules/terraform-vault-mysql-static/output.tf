output "vault_mount_mysql_path" {
  description = "Path for the Vault MySQL database secret engine mount"
  value       = vault_mount.mysql.path
}

output "vault_database_connection_name" {
  description = "The name of the Vault database connection"
  value       = vault_database_secret_backend_connection.mysql.name
}

output "vault_database_dynamic_creds_role" {
  description = "The name of the dynamic credentials role for the MySQL backend"
  value       = vault_database_secret_backend_role.mysql_dynamic_creds.name
}

output "vault_database_static_role" {
  description = "The name of the static role for the MySQL backend"
  value       = vault_database_secret_backend_static_role.mysql_static_role.name
}

output "vault_dynamic_creds_creation_statements" {
  description = "Creation statements for dynamic credentials role"
  value       = vault_database_secret_backend_role.mysql_dynamic_creds.creation_statements
}

output "vault_static_role_rotation_statements" {
  description = "Rotation statements for static role"
  value       = vault_database_secret_backend_static_role.mysql_static_role.rotation_statements
}
