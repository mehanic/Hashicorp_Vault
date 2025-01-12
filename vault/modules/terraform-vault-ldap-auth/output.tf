output "ldap_auth_backend_path" {
  description = "The path to the Vault LDAP auth backend"
  value       = vault_ldap_auth_backend.this.path
}

output "vault_ops_policy_name" {
  description = "The name of the Vault ops policy"
  value       = vault_policy.vault-ops.name
}

output "vault_identity_mgmt_policy_name" {
  description = "The name of the Vault identity management policy"
  value       = vault_policy.vault-id-mgmt.name
}

output "vault_qa_policy_name" {
  description = "The name of the Vault QA policy"
  value       = vault_policy.vault-qa.name
}

output "identity_entities" {
  description = "The list of identity entities created"
  value       = [for e in vault_identity_entity.this : e.name]
}

output "identity_groups" {
  description = "The list of identity groups created"
  value       = [for g in vault_identity_group.this : g.name]
}

output "identity_entity_aliases" {
  description = "The list of identity entity aliases created"
  value       = [for e in vault_identity_entity_alias.this : e.name]
}

output "identity_group_aliases" {
  description = "The list of identity group aliases created"
  value       = [for g in vault_identity_group_alias.this : g.name]
}

output "identity_oidc_assignments" {
  description = "The list of identity OIDC assignments"
  value       = [for a in vault_identity_oidc_assignment.this : a.name]
}

output "ldap_auth_backend_users" {
  value = {
    for user, details in vault_ldap_auth_backend_user.user : user => {
      username = details.username
      policies = details.policies
      backend  = details.backend
    }
  }
}
