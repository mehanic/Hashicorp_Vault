output "ldap_auth_backend_path" {
  description = "The path to the Vault LDAP auth backend"
  value       = module.terraform-vault-ldap-auth.ldap_auth_backend_path
}

output "vault_ops_policy_name" {
  description = "The name of the Vault ops policy"
  value       = module.terraform-vault-ldap-auth.vault_ops_policy_name
}

output "vault_identity_mgmt_policy_name" {
  description = "The name of the Vault identity management policy"
  value       = module.terraform-vault-ldap-auth.vault_identity_mgmt_policy_name
}

output "vault_qa_policy_name" {
  description = "The name of the Vault QA policy"
  value       = module.terraform-vault-ldap-auth.vault_qa_policy_name
}

output "identity_entities" {
  description = "The list of identity entities created"
  value       = module.terraform-vault-ldap-auth.identity_entities
}

output "identity_groups" {
  description = "The list of identity groups created"
  value       = module.terraform-vault-ldap-auth.identity_groups
}

output "identity_entity_aliases" {
  description = "The list of identity entity aliases created"
  value       = module.terraform-vault-ldap-auth.identity_entity_aliases
}

output "identity_group_aliases" {
  description = "The list of identity group aliases created"
  value       = module.terraform-vault-ldap-auth.identity_group_aliases
}

output "identity_oidc_assignments" {
  description = "The list of identity OIDC assignments"
  value       = module.terraform-vault-ldap-auth.identity_oidc_assignments
}

output "ldap_auth_backend_users" {
  value = module.terraform-vault-ldap-auth.ldap_auth_backend_users
}
