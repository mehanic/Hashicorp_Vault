output "backend_path" {
  description = "Secrets Backend Path as output"
  value       = module.terraform-vault-aws-identity-group.backend_path
}


output "vault_policy_name" {
  description = "The name of the generated Vault policy."
  value       = module.terraform-vault-aws-identity-group.vault_policy_name
}

output "vault_identity_group_id" {
  description = "The ID of the created Vault identity group."
  value       = module.terraform-vault-aws-identity-group.vault_identity_group_id
}

output "vault_identity_entity_id" {
  description = "The ID of the created Vault identity entity."
  value       = module.terraform-vault-aws-identity-group.vault_identity_entity_id
}

output "vault_identity_group_policies" {
  description = "The policies associated with the identity group."
  value       = module.terraform-vault-aws-identity-group.vault_identity_group_policies
}
