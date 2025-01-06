output "policy_name" {
  description = "The name of the created policy"
  value       = module.terraform-vault-policy.policy_name
}

output "policy_code" {
  description = "The policy content applied"
  value       = module.terraform-vault-policy.policy_code
}
