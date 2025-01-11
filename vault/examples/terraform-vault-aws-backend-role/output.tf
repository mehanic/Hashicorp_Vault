
# Output the path of the AWS secrets engine
output "aws_secret_backend_path" {
  description = "The path at which the AWS secrets engine is enabled."
  value       = module.terraform-vault-aws-backend-role.aws_secret_backend_path
}

# Output the name of the created role
output "aws_secret_backend_role_name" {
  description = "The name of the AWS secrets backend role."
  value       = module.terraform-vault-aws-backend-role.aws_secret_backend_role_name
}

# Output the backend path being used by the role
output "aws_secret_backend_role_backend" {
  description = "The path at which the AWS secrets backend role is configured."
  value       = module.terraform-vault-aws-backend-role.aws_secret_backend_role_backend
}

# Output the credential type for the role
output "aws_secret_backend_role_credential_type" {
  description = "The credential type for the AWS secrets backend role."
  value       = module.terraform-vault-aws-backend-role.aws_secret_backend_role_credential_type
}

# Output the default TTL for the STS credentials
output "aws_secret_backend_role_default_sts_ttl" {
  description = "The default TTL for the STS credentials."
  value       = module.terraform-vault-aws-backend-role.aws_secret_backend_role_default_sts_ttl
}

# Output the maximum TTL for the STS credentials
output "aws_secret_backend_role_max_sts_ttl" {
  description = "The maximum TTL for the STS credentials."
  value       = module.terraform-vault-aws-backend-role.aws_secret_backend_role_max_sts_ttl
}

# Output the policy ARNs assigned to the role
output "aws_secret_backend_role_policy_arns" {
  description = "The list of AWS policy ARNs assigned to the role."
  value       = module.terraform-vault-aws-backend-role.aws_secret_backend_role_policy_arns
}

# Output the role ARNs assigned to the role
output "aws_secret_backend_role_role_arns" {
  description = "The list of AWS role ARNs assigned to the role."
  value       = module.terraform-vault-aws-backend-role.aws_secret_backend_role_role_arns
}

# Output the policy document for the role
output "aws_secret_backend_role_policy_document" {
  description = "The IAM policy document associated with the role."
  value       = module.terraform-vault-aws-backend-role.aws_secret_backend_role_policy_document
}
