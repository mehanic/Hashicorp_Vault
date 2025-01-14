output "vault_identity_entity" {
  description = "The Vault Identity Entity created"
  value       = module.terraform-vault-all-identities
}

output "vault_identity_group" {
  description = "The Vault Identity Group created"
  value       = module.terraform-vault-all-identities
}

output "vault_identity_group_alias" {
  description = "The Vault Identity Group Alias created"
  value       = module.terraform-vault-all-identities
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
  value       = module.terraform-vault-all-identities
}

output "vault_identity_oidc_key" {
  description = "The Vault Identity OIDC Key created"
  value       = module.terraform-vault-all-identities
}

output "vault_identity_mfa_duo" {
  description = "The Vault MFA Duo method configured"
  value       = module.terraform-vault-all-identities
}

output "vault_identity_mfa_okta" {
  description = "The Vault MFA Okta method configured"
  value       = module.terraform-vault-all-identities
}

