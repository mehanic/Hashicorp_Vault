output "vault_role_name_map" {
  value = module.terraform-vault-approle-secret-id.vault_role_name_map
}

output "approle_accessor_map" {
  value = module.terraform-vault-approle-secret-id.approle_accessor_map
}

output "approle_wrapping_accessor" {
  value     = module.terraform-vault-approle-secret-id.approle_wrapping_accessor
  sensitive = true
}

output "approle_wrapping_token" {
  value     = module.terraform-vault-approle-secret-id.approle_wrapping_token
  sensitive = true
}

output "approle_role_id" {
  value = module.terraform-vault-approle-secret-id.approle_role_id
}


output "generated_rules" {
  description = "The flattened rules generated based on the named rules provided"
  value       = module.terraform-vault-approle-secret-id.generated_rules
}

output "audit_reader_rule" {
  description = "Audit reader rule details"
  value       = module.terraform-vault-approle-secret-id.audit_reader_rule
}

output "audit_manager_rule" {
  description = "Audit manager rule details"
  value       = module.terraform-vault-approle-secret-id.audit_manager_rule
}
