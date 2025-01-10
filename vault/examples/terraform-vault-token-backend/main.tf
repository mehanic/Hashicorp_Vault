module "terraform-vault-token-backend" {
  source = "../../modules/terraform-vault-token-backend"
  name   = "token"

  policy = <<EOT
path "auth/token/create" {
  capabilities = ["update"]
}
path "sys/policies/acl/token" {
  capabilities = ["read", "list"]
}
EOT

  disallowed_policies = ["default"]

  orphan = false

  token_period = 0

  renewable = true

  token_explicit_max_ttl = 0

  explicit_max_ttl = ""

  path_suffix = ""

  ttl = ""

  no_parent = false

  no_default_policy = false

  display_name = "token"

  num_uses = 0

  period = ""

  renew_min_lease = 0

  renew_increment = 0


}
