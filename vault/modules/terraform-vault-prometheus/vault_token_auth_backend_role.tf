resource "vault_token_auth_backend_role" "prometheus" {
  role_name         = vault_policy.prometheus.name
  allowed_policies  = [vault_policy.prometheus.name]
  token_bound_cidrs = var.token_cidrs
  orphan            = true
}
