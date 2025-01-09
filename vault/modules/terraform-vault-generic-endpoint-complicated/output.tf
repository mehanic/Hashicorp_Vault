output "credential_path" {
  value = replace(vault_database_secret_backend_role.readonly.id, "roles", "creds")
}

output "vault_mount_path" {
  description = "Path of the Vault database secret engine."
  value       = vault_mount.database.path
}

output "vault_connection_name" {
  description = "The name of the database connection in Vault."
  value       = vault_database_secret_backend_connection.this.name
}

output "vault_readonly_role_creation_statements" {
  description = "SQL statements used to create the readonly role."
  value       = vault_database_secret_backend_role.readonly.creation_statements
}

output "postgres_connection_url" {
  description = "PostgreSQL connection URL used for the Vault backend."
  value       = vault_database_secret_backend_connection.this.postgresql[0].connection_url
}

output "readonly_role_path" {
  description = "Path to the readonly role in Vault."
  value       = "${vault_database_secret_backend_connection.this.backend}/roles/readonly"
}

output "rotate_root_path" {
  description = "Path to rotate the root credentials of the database."
  value       = vault_generic_endpoint.this.path
}
