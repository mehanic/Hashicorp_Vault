# output "path" {
#   value = local.path
# }

# output "policy_name" {
#   value = vault_policy.this.name
# }


output "secret_path" {
  description = "The path where secrets are stored for the owner."
  value       = local.path
}

output "policy_name" {
  description = "The name of the policy created for the owner."
  value       = vault_policy.this.name
}

output "policy_hcl" {
  description = "The HCL representation of the policy."
  value       = vault_policy.this.policy
}
