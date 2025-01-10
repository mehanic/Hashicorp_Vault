output "vault_identity_group_encrypt" {
  description = "JSON data of the Vault Identity Group, including list of member entities"
  value       = data.vault_identity_group.encrypt.data_json
}

output "vault_identity_group_decrypt" {
  description = "JSON data of the Vault Identity Group, including list of member entities"
  value       = data.vault_identity_group.decrypt.data_json
}

# output "backend_path" {
#   description = "The path of mounted secret engine"
#   value = vault_mount.default.path
# }



# Output the Vault Transit Engine mount path
output "vault_transit_mount_path" {
  description = "The path of the Vault Transit Engine mount"
  value       = vault_mount.default.path
}

# Output the entity ID of the default Vault identity entity
output "vault_identity_entity_id" {
  description = "The entity ID of the default Vault identity entity"
  value       = vault_identity_entity.default.id
}

# Output the name of the encrypt policy
output "vault_encrypt_policy_name" {
  description = "The name of the Vault encrypt policy"
  value       = vault_policy.encrypt.name
}

# Output the name of the decrypt policy
output "vault_decrypt_policy_name" {
  description = "The name of the Vault decrypt policy"
  value       = vault_policy.decrypt.name
}

# Output the Vault Identity Group ID for encryption
output "vault_encrypt_group_id" {
  description = "The ID of the Vault identity group for encryption"
  value       = vault_identity_group.encrypt.id
}

# Output the Vault Identity Group ID for decryption
output "vault_decrypt_group_id" {
  description = "The ID of the Vault identity group for decryption"
  value       = vault_identity_group.decrypt.id
}

# Output the policies assigned to the encrypt identity group
output "vault_encrypt_group_policies" {
  description = "The policies assigned to the Vault identity group for encryption"
  value       = vault_identity_group_policies.encrypt.policies
}

# Output the policies assigned to the decrypt identity group
output "vault_decrypt_group_policies" {
  description = "The policies assigned to the Vault identity group for decryption"
  value       = vault_identity_group_policies.decrypt.policies
}
