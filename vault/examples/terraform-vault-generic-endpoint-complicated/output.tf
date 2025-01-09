output "credential_path" {
  value = module.terraform-vault-generic-endpoint-complicated.credential_path
}

output "vault_mount_path" {
  description = "Path of the Vault database secret engine."
  value       = module.terraform-vault-generic-endpoint-complicated.vault_mount_path
}

output "vault_connection_name" {
  description = "The name of the database connection in Vault."
  value       = module.terraform-vault-generic-endpoint-complicated.vault_connection_name
}

output "vault_readonly_role_creation_statements" {
  description = "SQL statements used to create the readonly role."
  value       = module.terraform-vault-generic-endpoint-complicated.vault_readonly_role_creation_statements
}

output "postgres_connection_url" {
  description = "PostgreSQL connection URL used for the Vault backend."
  value       = module.terraform-vault-generic-endpoint-complicated.postgres_connection_url
}

output "readonly_role_path" {
  description = "Path to the readonly role in Vault."
  value       = module.terraform-vault-generic-endpoint-complicated.readonly_role_path
}

output "rotate_root_path" {
  description = "Path to rotate the root credentials of the database."
  value       = module.terraform-vault-generic-endpoint-complicated.rotate_root_path
}
