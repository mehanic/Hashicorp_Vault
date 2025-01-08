output "vault_mount_database_path" {
  description = "Path where the Vault database secret engine is mounted"
  value       = vault_mount.database.path
}

output "vault_database_secret_backend_connection_postgres_name" {
  description = "The name of the Vault database secret backend connection for Postgres"
  value       = vault_database_secret_backend_connection.postgres.name
}

output "vault_database_secret_backend_role_postgres_service_write" {
  description = "The Vault database secret backend role for service-write access"
  value       = vault_database_secret_backend_role.postgres_service_write.name
}

output "vault_database_secret_backend_role_postgres_dev_read" {
  description = "The Vault database secret backend role for dev-read access"
  value       = vault_database_secret_backend_role.postgres_dev_read.name
}
