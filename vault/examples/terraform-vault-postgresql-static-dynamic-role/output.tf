output "vault_mount_path" {
  description = "Path of the Vault database secrets engine mount."
  value       = module.terraform-vault-postgresql-static-dynamic-role.vault_mount_path
}

output "vault_database_secret_backend_connection" {
  description = "Details of the Vault database secret backend connection."
  value       = module.terraform-vault-postgresql-static-dynamic-role.vault_database_secret_backend_connection
}

output "vault_database_secret_backend_role_dynamic" {
  description = "Details of the Vault database secret backend dynamic credentials role."
  value       = module.terraform-vault-postgresql-static-dynamic-role.vault_database_secret_backend_role_dynamic
}

output "vault_database_secret_backend_static_role" {
  description = "Details of the Vault database secret backend static role."
  value       = module.terraform-vault-postgresql-static-dynamic-role.vault_database_secret_backend_static_role
}
