output "aws_secret_backend_path" {
  value = vault_aws_secret_backend.aws_vault_account.path
}

output "aws_vault_account_access_key" {
  value = aws_iam_access_key.vault.id
}

output "dyndns_role_name" {
  value = vault_aws_secret_backend_role.dyndns.name
}

output "dyndns_policy_name" {
  value = vault_policy.dyndns.name
}

output "dyndns_policy_path" {
  value = vault_policy.dyndns.policy
}
