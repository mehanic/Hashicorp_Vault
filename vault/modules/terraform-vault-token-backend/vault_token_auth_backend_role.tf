resource "vault_token_auth_backend_role" "this" {
  role_name              = var.name
  allowed_policies       = [vault_policy.this.id]
  disallowed_policies    = var.disallowed_policies
  orphan                 = var.orphan
  token_period           = var.token_period
  renewable              = var.renewable
  token_explicit_max_ttl = var.token_explicit_max_ttl
  path_suffix            = var.path_suffix
}
