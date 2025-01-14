# Output the AWS secret backend path
output "aws_secret_backend_path" {
  description = "The path for the AWS secret backend"
  value       = module.terraform-vault-aws-ec2.aws_secret_backend_path
}

# Output the AWS secret backend role name
output "aws_secret_backend_role_name" {
  description = "The name of the AWS secret backend role"
  value       = module.terraform-vault-aws-ec2.aws_secret_backend_role_name
}

# Output the policy document attached to the AWS role
output "aws_secret_backend_role_policy_document" {
  description = "The policy document for the AWS secret backend role"
  value       = module.terraform-vault-aws-ec2.aws_secret_backend_role_policy_document
}
