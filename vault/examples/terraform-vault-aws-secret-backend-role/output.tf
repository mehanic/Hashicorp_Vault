output "aws_secret_backend_path" {
  value = module.terraform-vault-aws-secret-backend-role.aws_secret_backend_path
}

output "aws_vault_account_access_key" {
  value = module.terraform-vault-aws-secret-backend-role.aws_vault_account_access_key
}

output "dyndns_role_name" {
  value = module.terraform-vault-aws-secret-backend-role.dyndns_role_name
}

output "dyndns_policy_name" {
  value = module.terraform-vault-aws-secret-backend-role.dyndns_policy_name
}

output "dyndns_policy_path" {
  value = module.terraform-vault-aws-secret-backend-role.dyndns_policy_path
}
