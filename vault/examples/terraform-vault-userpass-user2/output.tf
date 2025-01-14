output "vault_user" {
  description = "The created user in the userpass authentication backend"
  value       = module.terraform-vault-userpass-user2.vault_user
}

output "vault_creds_policy" {
  description = "The name of the created policy"
  value       = module.terraform-vault-userpass-user2.vault_creds_policy
}

output "vault_creds_secret_path" {
  description = "The path to the created secret in Vault"
  value       = module.terraform-vault-userpass-user2.vault_creds_secret_path
}
