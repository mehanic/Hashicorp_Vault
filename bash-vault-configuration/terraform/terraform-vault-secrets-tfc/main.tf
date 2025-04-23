locals {
  secret_type = "terraform"
}

# Vault Terraform Cloud Secret Backend Configuration
resource "vault_terraform_cloud_secret_backend" "default" {
  token       = var.token
  description = "TFC Secrets Backend"
}

# Define Vault Policy Document for Default Access to TFC Secrets
data "vault_policy_document" "default" {
  rule {
    path         = "${local.secret_type}/creds/{{identity.entity.metadata.application}}"
    capabilities = ["read"]
    description  = "Allow generation of tfc tokens, the end path name is the role name"
  }
  rule {
    path         = "auth/token/*"
    capabilities = ["create", "read", "update", "delete", "list"]
    description  = "create child tokens"
  }
}

# Create Vault Policy for Default Access to TFC Secrets
resource "vault_policy" "default" {
  name   = "${local.secret_type}-creds-tmpl"
  policy = data.vault_policy_document.default.hcl
}

# Create Vault Identity Group for Terraform Cloud Credentials
resource "vault_identity_group" "default" {
  name                       = "${local.secret_type}-creds"
  type                       = "internal"
  external_policies          = true
  external_member_entity_ids = true
}

# Attach the Default Policy to the Identity Group
resource "vault_identity_group_policies" "default" {
  group_id  = vault_identity_group.default.id
  exclusive = false
  policies = [
    "default",
    vault_policy.default.name,
  ]
}

# Define Vault Policy Document for Admin Access to TFC Secrets
data "vault_policy_document" "admin" {
  rule {
    path         = "${local.secret_type}/creds/*"
    capabilities = ["read"]
    description  = "Allow generation of tfc tokens, the end path name is the role name"
  }
  rule {
    path         = "auth/token/*"
    capabilities = ["create", "read", "update", "delete", "list"]
    description  = "create child tokens"
  }
}

# Create Vault Policy for Admin Access to TFC Secrets
resource "vault_policy" "admin" {
  name   = "${local.secret_type}-creds-admin"
  policy = data.vault_policy_document.admin.hcl
}
