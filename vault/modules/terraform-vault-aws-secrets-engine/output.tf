# Output the path of the AWS secrets backend
output "aws_secret_backend_path" {
  description = "The path at which the AWS secrets engine is enabled."
  value       = vault_aws_secret_backend.aws_backend.path
}

# Output the access key used for the AWS secrets backend
output "aws_secret_backend_access_key" {
  description = "The access key for the AWS secrets backend."
  value       = vault_aws_secret_backend.aws_backend.access_key
  sensitive   = true
}

# Output the region of the AWS secrets backend
output "aws_secret_backend_region" {
  description = "The AWS region configured for the secrets backend."
  value       = vault_aws_secret_backend.aws_backend.region
}

# Output the default lease TTL for the AWS secrets backend
output "aws_secret_backend_default_lease_ttl" {
  description = "The default lease TTL for the AWS secrets backend."
  value       = vault_aws_secret_backend.aws_backend.default_lease_ttl_seconds
}

# Output the max lease TTL for the AWS secrets backend
output "aws_secret_backend_max_lease_ttl" {
  description = "The max lease TTL for the AWS secrets backend."
  value       = vault_aws_secret_backend.aws_backend.max_lease_ttl_seconds
}

# Output the name of the AWS secret backend role
output "aws_secret_backend_role_name" {
  description = "The name of the AWS secrets backend role."
  value       = vault_aws_secret_backend_role.aws_backend_role.name
}

# Output the credential type for the AWS secrets backend role
output "aws_secret_backend_role_credential_type" {
  description = "The credential type for the AWS secrets backend role."
  value       = vault_aws_secret_backend_role.aws_backend_role.credential_type
}

# Output the backend path for the AWS secrets backend role
output "aws_secret_backend_role_backend" {
  description = "The backend path used by the AWS secrets backend role."
  value       = vault_aws_secret_backend_role.aws_backend_role.backend
}

# Output the role ARNs for the AWS secrets backend role
output "aws_secret_backend_role_role_arns" {
  description = "The role ARNs associated with the AWS secrets backend role."
  value       = vault_aws_secret_backend_role.aws_backend_role.role_arns
}

# Output the policy ARNs for the AWS secrets backend role
output "aws_secret_backend_role_policy_arns" {
  description = "The policy ARNs associated with the AWS secrets backend role."
  value       = vault_aws_secret_backend_role.aws_backend_role.policy_arns
}

# Output the policy document for the AWS secrets backend role
output "aws_secret_backend_role_policy_document" {
  description = "The policy document associated with the AWS secrets backend role."
  value       = vault_aws_secret_backend_role.aws_backend_role.policy_document
}

# Output the IAM groups associated with the AWS secrets backend role
output "aws_secret_backend_role_iam_groups" {
  description = "The IAM groups associated with the AWS secrets backend role."
  value       = vault_aws_secret_backend_role.aws_backend_role.iam_groups
}

# Output the default STS TTL for the AWS secrets backend role
output "aws_secret_backend_role_default_sts_ttl" {
  description = "The default STS TTL for the AWS secrets backend role."
  value       = vault_aws_secret_backend_role.aws_backend_role.default_sts_ttl
}

# Output the max STS TTL for the AWS secrets backend role
output "aws_secret_backend_role_max_sts_ttl" {
  description = "The max STS TTL for the AWS secrets backend role."
  value       = vault_aws_secret_backend_role.aws_backend_role.max_sts_ttl
}
