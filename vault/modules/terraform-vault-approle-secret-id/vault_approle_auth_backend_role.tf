resource "vault_approle_auth_backend_role" "approle_role" {
  for_each = var.enable_approle_login ? var.backend_paths : {}

  backend        = each.key
  role_name      = each.value
  bind_secret_id = true

  token_policies = [vault_policy.policy.name]
  token_ttl      = var.token_ttl
  token_max_ttl  = var.token_max_ttl
}