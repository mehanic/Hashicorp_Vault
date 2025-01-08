output "role_id" {
  description = "The ID of the AppRole used for authentication."
  value       = vault_approle_auth_backend_role.default.role_id
}

output "role_name" {
  description = "The name of the AppRole used for authentication."
  value       = vault_approle_auth_backend_role.default.role_name
}

output "secret_id" {
  description = "The secret ID generated for the AppRole."
  value       = vault_approle_auth_backend_role_secret_id.default.secret_id
  sensitive   = true
}

output "entity_id" {
  description = "The ID of the identity entity associated with the role."
  value       = vault_identity_entity.default.id
}

output "entity_alias_id" {
  description = "The ID of the entity alias associated with the entity."
  value       = vault_identity_entity_alias.default.id
}

output "group_id" {
  description = "The ID of the Vault identity group."
  value       = vault_identity_group.development.id
}

output "member_entity_ids" {
  description = "The member entity IDs associated with the identity group."
  value       = vault_identity_group_member_entity_ids.default.member_entity_ids
}
