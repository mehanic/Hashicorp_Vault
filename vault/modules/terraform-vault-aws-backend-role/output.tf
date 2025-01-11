
# Output the path of the AWS secrets engine
output "aws_secret_backend_path" {
  description = "The path at which the AWS secrets engine is enabled."
  value       = vault_aws_secret_backend.this.path
}

# Output the name of the created role
output "aws_secret_backend_role_name" {
  description = "The name of the AWS secrets backend role."
  value       = vault_aws_secret_backend_role.this.name
}

# Output the backend path being used by the role
output "aws_secret_backend_role_backend" {
  description = "The path at which the AWS secrets backend role is configured."
  value       = vault_aws_secret_backend_role.this.backend
}

# Output the credential type for the role
output "aws_secret_backend_role_credential_type" {
  description = "The credential type for the AWS secrets backend role."
  value       = vault_aws_secret_backend_role.this.credential_type
}

# Output the default TTL for the STS credentials
output "aws_secret_backend_role_default_sts_ttl" {
  description = "The default TTL for the STS credentials."
  value       = vault_aws_secret_backend_role.this.default_sts_ttl
}

# Output the maximum TTL for the STS credentials
output "aws_secret_backend_role_max_sts_ttl" {
  description = "The maximum TTL for the STS credentials."
  value       = vault_aws_secret_backend_role.this.max_sts_ttl
}

# Output the policy ARNs assigned to the role
output "aws_secret_backend_role_policy_arns" {
  description = "The list of AWS policy ARNs assigned to the role."
  value       = vault_aws_secret_backend_role.this.policy_arns
}

# Output the role ARNs assigned to the role
output "aws_secret_backend_role_role_arns" {
  description = "The list of AWS role ARNs assigned to the role."
  value       = vault_aws_secret_backend_role.this.role_arns
}

# Output the policy document for the role
output "aws_secret_backend_role_policy_document" {
  description = "The IAM policy document associated with the role."
  value       = vault_aws_secret_backend_role.this.policy_document
}
