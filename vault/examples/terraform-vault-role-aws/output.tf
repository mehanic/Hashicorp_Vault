# Output for the path where the AWS secret backend is mounted
output "aws_secret_backend_path" {
  description = "The path where the AWS secret backend is mounted."
  value       = module.terraform-vault-role-aws.aws_secret_backend_path
}

# Output for the IAM user created for Vault
output "iam_user_name" {
  description = "The name of the IAM user created for Vault."
  value       = module.terraform-vault-role-aws.iam_user_name
}

# Output for the IAM access key ID generated for Vault IAM user
output "iam_access_key_id" {
  description = "The access key ID for the IAM user created for Vault."
  value       = module.terraform-vault-role-aws.iam_access_key_id
}

# Output for the IAM user policy created for the Vault IAM user
output "iam_user_policy" {
  description = "The IAM policy attached to the Vault IAM user."
  value       = module.terraform-vault-role-aws.iam_user_policy
}
