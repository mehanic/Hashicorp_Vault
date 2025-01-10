output "client_token" {
  value       = module.terraform-vault-token-backend.client_token
  description = "Client vault token"
  sensitive   = true
}

output "token_id" {
  value       = module.terraform-vault-token-backend.token_id
  description = "Token ID"
}


# Output the name of the Vault policy
output "vault_policy_name" {
  description = "The name of the Vault policy created"
  value       = module.terraform-vault-token-backend.vault_policy_name
}

# Output the content of the Vault policy
output "vault_policy_content" {
  description = "The content of the Vault policy"
  value       = module.terraform-vault-token-backend.vault_policy_content
}

# Output the role name for the Vault token auth backend role
output "vault_token_auth_backend_role_name" {
  description = "The role name for the Vault token auth backend"
  value       = module.terraform-vault-token-backend.vault_token_auth_backend_role_name
}

# Output the allowed policies for the Vault token auth backend role
output "vault_token_auth_backend_role_allowed_policies" {
  description = "The allowed policies for the Vault token auth backend role"
  value       = module.terraform-vault-token-backend.vault_token_auth_backend_role_allowed_policies
}

# Output the disallowed policies for the Vault token auth backend role
output "vault_token_auth_backend_role_disallowed_policies" {
  description = "The disallowed policies for the Vault token auth backend role"
  value       = module.terraform-vault-token-backend.vault_token_auth_backend_role_disallowed_policies
}

# Output the display name for the Vault token
output "vault_token_display_name" {
  description = "The display name for the Vault token"
  value       = module.terraform-vault-token-backend.vault_token_display_name
}

# Output the number of allowed uses for the Vault token
output "vault_token_num_uses" {
  description = "The number of allowed uses for the Vault token"
  value       = module.terraform-vault-token-backend.vault_token_num_uses
}

# Output the period for the Vault token
output "vault_token_period" {
  description = "The period of the Vault token"
  value       = module.terraform-vault-token-backend.vault_token_period
}

# Output the TTL for the Vault token
output "vault_token_ttl" {
  description = "The TTL of the Vault token"
  value       = module.terraform-vault-token-backend.vault_token_ttl
}

# Output the explicit max TTL for the Vault token
output "vault_token_explicit_max_ttl" {
  description = "The explicit max TTL for the Vault token"
  value       = module.terraform-vault-token-backend.vault_token_explicit_max_ttl
}
