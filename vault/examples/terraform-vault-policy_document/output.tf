# Outputs for the secret mount path
output "secret_mount_path" {
  value = module.terraform-vault-policy_document.secret_mount_path
  description = "The path where the KV v2 secrets engine is mounted."
}

# Outputs for the policy document in HCL format
output "policy_hcl" {
  value = module.terraform-vault-policy_document.policy_hcl
  description = "The policy document in HCL format."
}

# Output the name of the created policy
output "policy_name" {
  value = module.terraform-vault-policy_document.policy_name
  description = "The name of the created Vault policy."
}

# Output the Vault identity group ID
output "identity_group_id" {
  value = module.terraform-vault-policy_document.identity_group_id
  description = "The ID of the Vault identity group."
}

# Output the Vault identity group name
output "identity_group_name" {
  value = module.terraform-vault-policy_document.identity_group_name
  description = "The name of the Vault identity group."
}

# Output the attached policies to the identity group
output "identity_group_policies" {
  value = module.terraform-vault-policy_document.identity_group_policies
  description = "The policies attached to the Vault identity group."
}
