output "kv-path" {
  value       = module.terraform-vault-kv.kv-path
  description = "prints the the full path of the secrets being stored"
}
output "policy" {
  value       = module.terraform-vault-kv.policy
  description = "prints the policy"
}