output "vault_identity_group_id" {
  description = "ID of the Vault Identity Group"
  value       = vault_identity_group.default.id
}

output "vault_identity_group_default_name" {
  description = "Name of the default Vault Identity Group"
  value       = vault_identity_group.default.name
}

output "vault_identity_group_placeholder_id" {
  description = "ID of the placeholder Vault Identity Group"
  value       = vault_identity_group.placeholder.id
}

output "vault_identity_group_placeholder_name" {
  description = "Name of the placeholder Vault Identity Group"
  value       = vault_identity_group.placeholder.name
}

output "vault_policy_default_name" {
  description = "Name of the default Vault policy"
  value       = vault_policy.default.name
}
