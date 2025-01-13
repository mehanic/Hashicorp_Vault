# Output for the AWS IAM role created
output "iac_admin_role_name" {
  description = "The name of the IAM role created for IAC Admin."
  value       = module.terraform-vault-aws-policy-attachment.iac_admin_role_name
}

output "iac_admin_role_arn" {
  description = "The ARN of the IAM role created for IAC Admin."
  value       = module.terraform-vault-aws-policy-attachment.iac_admin_role_arn
}

# Output for the IAM role policy attachment
output "test_role_policy_attachment" {
  description = "The ARN of the IAM role policy attachment."
  value       = module.terraform-vault-aws-policy-attachment.test_role_policy_attachment
}

# Output for the Vault AWS mount path
output "vault_aws_mount_path" {
  description = "The mount path of the Vault AWS backend."
  value       = module.terraform-vault-aws-policy-attachment.vault_aws_mount_path
}

# Output for the Vault AWS secret backend role
output "vault_aws_secret_backend_role_name" {
  description = "The name of the Vault AWS secret backend role."
  value       = module.terraform-vault-aws-policy-attachment.vault_aws_secret_backend_role_name
}