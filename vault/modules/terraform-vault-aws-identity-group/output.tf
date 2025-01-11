output "backend_path" {
  description = "Secrets Backend Path as output"
  value       = vault_aws_secret_backend.default.path
}


output "vault_policy_name" {
  description = "The name of the generated Vault policy."
  value       = vault_policy.default.name
}

output "vault_identity_group_id" {
  description = "The ID of the created Vault identity group."
  value       = vault_identity_group.default.id
}

output "vault_identity_entity_id" {
  description = "The ID of the created Vault identity entity."
  value       = vault_identity_entity.default.id
}

output "vault_identity_group_policies" {
  description = "The policies associated with the identity group."
  value       = vault_identity_group_policies.default.policies
}
