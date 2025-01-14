# Define the outputs from this configuration

output "vault_user" {
  description = "The created user in the userpass authentication backend"
  value       = "auth/userpass/users/${var.login_username}"
}

output "vault_creds_policy" {
  description = "The name of the created policy"
  value       = vault_policy.developer-vault-policy.name
}

output "vault_creds_secret_path" {
  description = "The path to the created secret in Vault"
  value       = "dev-secrets1/data/creds"
}
