output "policy_name" {
  description = "The name of the created policy"
  value       = vault_policy.acl.name
}

output "policy_code" {
  description = "The policy content applied"
  value       = vault_policy.acl.policy
}
