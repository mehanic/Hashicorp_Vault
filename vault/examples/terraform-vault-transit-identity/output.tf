output "vault_identity_group_encrypt" {
  description = "JSON data of the Vault Identity Group, including list of member entities"
  value       = module.terraform-vault-transit-identity.vault_identity_group_encrypt
}

output "vault_identity_group_decrypt" {
  description = "JSON data of the Vault Identity Group, including list of member entities"
  value       = module.terraform-vault-transit-identity.vault_identity_group_decrypt

}

# output "backend_path" {
#   description = "The path of mounted secret engine"
#   value = vault_mount.default.path
# }



# Output the Vault Transit Engine mount path
output "vault_transit_mount_path" {
  description = "The path of the Vault Transit Engine mount"
  value       = module.terraform-vault-transit-identity.vault_transit_mount_path

}

# Output the entity ID of the default Vault identity entity
output "vault_identity_entity_id" {
  description = "The entity ID of the default Vault identity entity"
  value       = module.terraform-vault-transit-identity.vault_identity_entity_id

}

# Output the name of the encrypt policy
output "vault_encrypt_policy_name" {
  description = "The name of the Vault encrypt policy"
  value       = module.terraform-vault-transit-identity.vault_encrypt_policy_name

}

# Output the name of the decrypt policy
output "vault_decrypt_policy_name" {
  description = "The name of the Vault decrypt policy"
  value       = module.terraform-vault-transit-identity.vault_decrypt_policy_name

}

# Output the Vault Identity Group ID for encryption
output "vault_encrypt_group_id" {
  description = "The ID of the Vault identity group for encryption"
  value       = module.terraform-vault-transit-identity.vault_encrypt_group_id

}

# Output the Vault Identity Group ID for decryption
output "vault_decrypt_group_id" {
  description = "The ID of the Vault identity group for decryption"
  value       = module.terraform-vault-transit-identity.vault_decrypt_group_id

}

# Output the policies assigned to the encrypt identity group
output "vault_encrypt_group_policies" {
  description = "The policies assigned to the Vault identity group for encryption"
  value       = module.terraform-vault-transit-identity.vault_encrypt_group_policies

}

# Output the policies assigned to the decrypt identity group
output "vault_decrypt_group_policies" {
  description = "The policies assigned to the Vault identity group for decryption"
  value       = module.terraform-vault-transit-identity.vault_decrypt_group_policies

}
