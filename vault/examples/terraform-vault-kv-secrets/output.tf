output "secret_path" {
  description = "The path where secrets are stored for the owner."
  value       = module.terraform-vault-kv-secrets.secret_path
}

output "policy_name" {
  description = "The name of the policy created for the owner."
  value       = module.terraform-vault-kv-secrets.policy_name
}

output "policy_hcl" {
  description = "The HCL representation of the policy."
  value       = module.terraform-vault-kv-secrets.policy_hcl
}
