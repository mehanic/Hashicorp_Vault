output "approle_identity_ids" {
  value = module.terraform-vault-auth-approle.approle_identity_ids
}

output "approle_identities" {
  value = module.terraform-vault-auth-approle.approle_identities
}


output "approle_roles" {
  description = "The list of created AppRole roles."
  value       = module.terraform-vault-auth-approle.approle_roles

}

output "approle_identity_entities" {
  description = "The identity entities created for AppRoles."
  value       = module.terraform-vault-auth-approle.approle_identity_entities
}

output "approle_identity_aliases" {
  description = "The identity aliases created for AppRoles."
  value       = module.terraform-vault-auth-approle.approle_identity_aliases
}

output "approle_policies" {
  description = "The AppRole rotation policy created."
  value       = module.terraform-vault-auth-approle.approle_policies
}

output "identity_groups" {
  description = "The identity groups created for AppRoles."
  value       = module.terraform-vault-auth-approle.identity_groups
}


