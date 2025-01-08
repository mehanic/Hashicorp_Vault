output "role_id" {
  description = "The ID of the AppRole used for authentication."
  value       = module.terraform-vault-identity.role_id
}

output "role_name" {
  description = "The name of the AppRole used for authentication."
  value       = module.terraform-vault-identity.role_name
}

output "secret_id" {
  description = "The secret ID generated for the AppRole."
  value       = module.terraform-vault-identity.secret_id
  sensitive   = true
}

output "entity_id" {
  description = "The ID of the identity entity associated with the role."
  value       = module.terraform-vault-identity.entity_id
}

output "entity_alias_id" {
  description = "The ID of the entity alias associated with the entity."
  value       = module.terraform-vault-identity.entity_alias_id
}

output "group_id" {
  description = "The ID of the Vault identity group."
  value       = module.terraform-vault-identity.group_id
}

output "member_entity_ids" {
  description = "The member entity IDs associated with the identity group."
  value       = module.terraform-vault-identity.member_entity_ids
}
