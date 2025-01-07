# Output for the token authentication backend role "emergency"
output "token_auth_backend_role_emergency" {
  description = "The role name of the emergency token authentication backend role."
  value       = module.terraform-vault-token-emergency.token_auth_backend_role_emergency
}

# Output for the emergency token created
output "emergency_token_id" {
  description = "The ID of the emergency token."
  value       = module.terraform-vault-token-emergency.emergency_token_id
}

# Output for the emergency policy created
output "emergency_policy_name" {
  description = "The name of the emergency policy."
  value       = module.terraform-vault-token-emergency.emergency_policy_name
}

# Output for the emergency policy content
output "emergency_policy" {
  description = "The policy content for the emergency policy."
  value       = module.terraform-vault-token-emergency.emergency_policy
}

# Output for the token TTL defined for the emergency token
output "emergency_token_ttl" {
  description = "The TTL value defined for the emergency token."
  value       = module.terraform-vault-token-emergency.emergency_token_ttl
}
