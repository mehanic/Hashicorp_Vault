# Output for the AWS IAM role created
output "iac_admin_role_name" {
  description = "The name of the IAM role created for IAC Admin."
  value       = aws_iam_role.iac_admin_role.name
}

output "iac_admin_role_arn" {
  description = "The ARN of the IAM role created for IAC Admin."
  value       = aws_iam_role.iac_admin_role.arn
}

# Output for the IAM role policy attachment
output "test_role_policy_attachment" {
  description = "The ARN of the IAM role policy attachment."
  value       = aws_iam_role_policy_attachment.test-attach.policy_arn
}

# Output for the Vault AWS mount path
output "vault_aws_mount_path" {
  description = "The mount path of the Vault AWS backend."
  value       = vault_mount.aws.path
}

# Output for the Vault AWS secret backend role
output "vault_aws_secret_backend_role_name" {
  description = "The name of the Vault AWS secret backend role."
  value       = vault_aws_secret_backend_role.terraform_role.name
}