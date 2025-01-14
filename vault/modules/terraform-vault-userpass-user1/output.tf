output "vault_creds_secret_path" {
  description = "The path to the created secret in Vault"
  value       = "dev-secrets/data/creds"
}

output "vault_creds_policy" {
  description = "The name of the created policy"
  value       = vault_policy.creds_policy.name
}

output "vault_user" {
  description = "The created user in the userpass authentication backend"
  value       = var.login_username
}
