resource "vault_token" "prometheus" {
  depends_on = [vault_token_auth_backend_role.prometheus]
  role_name  = "prometheus"
  policies = [
    vault_policy.prometheus.name
  ]
  display_name = "prometheus-access"
  renewable    = true
  num_uses     = 0
  ttl          = var.token_ttl
}