output "vault_identity_entity" {
  description = "The Vault Identity Entity created"
  value       = vault_identity_entity.test.name
}

output "vault_identity_group" {
  description = "The Vault Identity Group created"
  value       = vault_identity_group.internal.name
}

output "vault_identity_group_alias" {
  description = "The Vault Identity Group Alias created"
  value       = vault_identity_group_alias.group-alias.name
}

# output "vault_identity_oidc_client" {
#   description = "The Vault Identity OIDC Client created"
#   value       = vault_identity_oidc_client.test.name
# }

# output "vault_identity_oidc_provider" {
#   description = "The Vault Identity OIDC Provider created"
#   value       = vault_identity_oidc_provider.test.name
# }

output "vault_identity_oidc_role" {
  description = "The Vault Identity OIDC Role created"
  value       = vault_identity_oidc_role.role.name
}

output "vault_identity_oidc_key" {
  description = "The Vault Identity OIDC Key created"
  value       = vault_identity_oidc_key.test.name
}

output "vault_identity_mfa_duo" {
  description = "The Vault MFA Duo method configured"
  value       = vault_identity_mfa_duo.example.api_hostname
}

output "vault_identity_mfa_okta" {
  description = "The Vault MFA Okta method configured"
  value       = vault_identity_mfa_okta.example.org_name
}
