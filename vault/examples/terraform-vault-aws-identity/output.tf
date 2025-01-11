output "vault_identity_group_id" {
  description = "ID of the Vault Identity Group"
  value       = module.terraform-vault-aws-identity.vault_identity_group_id
}

output "vault_identity_group_default_name" {
  description = "Name of the default Vault Identity Group"
  value       = module.terraform-vault-aws-identity.vault_identity_group_default_name
}

output "vault_identity_group_placeholder_id" {
  description = "ID of the placeholder Vault Identity Group"
  value       = module.terraform-vault-aws-identity.vault_identity_group_placeholder_id
}

output "vault_identity_group_placeholder_name" {
  description = "Name of the placeholder Vault Identity Group"
  value       = module.terraform-vault-aws-identity.vault_identity_group_placeholder_name
}

output "vault_policy_default_name" {
  description = "Name of the default Vault policy"
  value       = module.terraform-vault-aws-identity.vault_policy_default_name
}
