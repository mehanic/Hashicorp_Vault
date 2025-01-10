output "credential_paths" {
  value = module.terraform-vault-generic-endpoint-token.credential_paths
}

output "token" {
  value     = module.terraform-vault-generic-endpoint-token.token
  sensitive = true
}

output "vault_database_secret_backend_connection" {
  description = "Details of the Vault database secret backend connection."
  value       = module.terraform-vault-generic-endpoint-token.vault_database_secret_backend_connection
}
output "vault_database_secret_backend_role" {
  description = "List of Vault database secret backend roles."
  value       = module.terraform-vault-generic-endpoint-token.vault_database_secret_backend_role
}

output "vault_policies" {
  description = "List of Vault policies created for the database roles."
  value       = module.terraform-vault-generic-endpoint-token.vault_policies
}

output "vault_token" {
  description = "Vault token for service account with associated policies."
  value       = module.terraform-vault-generic-endpoint-token.vault_token
}
