output "vault_policy_name" {
  description = "The name of the generated Vault policy"
  value       = module.terraform-vault-aws.vault_policy_name

}

output "aws_auth_backend_roles" {
  description = "The roles created in the AWS Auth Backend"
  value       = module.terraform-vault-aws.aws_auth_backend_roles
}

output "generated_rules" {
  description = "The flattened rules generated based on the named and provided rules"
  value       = module.terraform-vault-aws.generated_rules
}
