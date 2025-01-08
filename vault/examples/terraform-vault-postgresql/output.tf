output "vault_mount_database_path" {
  description = "Path where the Vault database secret engine is mounted"
  value       = module.terraform-vault-postgresql.vault_mount_database_path
}

output "vault_database_secret_backend_connection_postgres_name" {
  description = "The name of the Vault database secret backend connection for Postgres"
  value       = module.terraform-vault-postgresql.vault_database_secret_backend_connection_postgres_name
}

output "vault_database_secret_backend_role_postgres_service_write" {
  description = "The Vault database secret backend role for service-write access"
  value       = module.terraform-vault-postgresql.vault_database_secret_backend_role_postgres_service_write
}

output "vault_database_secret_backend_role_postgres_dev_read" {
  description = "The Vault database secret backend role for dev-read access"
  value       = module.terraform-vault-postgresql.vault_database_secret_backend_role_postgres_dev_read
}
