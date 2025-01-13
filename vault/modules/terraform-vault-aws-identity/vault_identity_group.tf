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
