# Output the AWS secret backend path
output "aws_secret_backend_path" {
  description = "The path for the AWS secret backend"
  value       = vault_aws_secret_backend.aws.path
}

# Output the AWS secret backend role name
output "aws_secret_backend_role_name" {
  description = "The name of the AWS secret backend role"
  value       = vault_aws_secret_backend_role.ec2-admin.name
}

# Output the policy document attached to the AWS role
output "aws_secret_backend_role_policy_document" {
  description = "The policy document for the AWS secret backend role"
  value       = vault_aws_secret_backend_role.ec2-admin.policy_document
}
