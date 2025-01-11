locals {
  member_group_ids = var.group_ids != [] ? var.group_ids : [vault_identity_group.placeholder.id]
}

resource "vault_aws_secret_backend" "default" {}

data "vault_policy_document" "default" {
  rule {
    path         = "aws/creds/{{identity.groups.names.aws-creds.metadata.env}}-{{identity.groups.names.aws-creds.metadata.service}}"
    capabilities = ["read"]
    description  = "Allow generating credentials"
  }
}

resource "vault_policy" "default" {
  name   = "aws-creds-tmpl"
  policy = data.vault_policy_document.default.hcl
}

resource "vault_identity_group" "default" {
  name             = "aws-creds"
  type             = "internal"
  policies         = ["default", vault_policy.default.name]
  member_group_ids = local.member_group_ids
}

resource "vault_identity_group" "placeholder" {
  name = "aws-creds-default-group"
  metadata = {
    env     = "dev"
    service = "example"
  }
}
