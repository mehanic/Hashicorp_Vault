output "secret1_path" {
  description = "Path for secret1"
  value       = module.terraform-vault-kv-v2-for-each.secret1_path
}

output "secret2_path" {
  description = "Path for secret2"
  value       = module.terraform-vault-kv-v2-for-each.secret2_path
}

output "secret3_path" {
  description = "Path for secret3"
  value       = module.terraform-vault-kv-v2-for-each.secret3_path
}
