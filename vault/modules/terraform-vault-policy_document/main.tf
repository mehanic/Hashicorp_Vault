locals {
  secret_type = var.secret_type
}

# Vault mount for KV v2 secrets engine
resource "vault_mount" "default" {
  path        = "secretv2"
  type        = "kv-v2"
  description = "Default Mount for KV Secrets Engine"
}

# Vault policy document
data "vault_policy_document" "default" {
  rule {
    path         = "${local.secret_type}/+/{{identity.entity.metadata.env}}-{{identity.entity.metadata.service}}"
    capabilities = ["read"]
    description  = "Allow read access to secrets with dynamic paths."
  }

  rule {
    path         = "auth/token/*"
    capabilities = ["create", "read", "update", "delete", "list"]
    description  = "Create and manage child tokens."
  }
}

# Vault policy creation
resource "vault_policy" "default" {
  name   = "${local.secret_type}-creds-tmpl"
  policy = data.vault_policy_document.default.hcl
}

# Vault identity group configuration
resource "vault_identity_group" "default" {
  name                       = "${local.secret_type}-creds"
  type                       = "internal"
  external_policies          = var.external_policies
  external_member_entity_ids = var.external_member_entity_ids
}

# Assign policies to the identity group
resource "vault_identity_group_policies" "default" {
  group_id  = vault_identity_group.default.id
  exclusive = true
  policies  = [
    "default",
    vault_policy.default.name,
  ]
}