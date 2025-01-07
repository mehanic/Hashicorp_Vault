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

resource "vault_token_auth_backend_role" "prometheus" {
  role_name         = vault_policy.prometheus.name
  allowed_policies  = [vault_policy.prometheus.name]
  token_bound_cidrs = var.token_cidrs
  orphan            = true
}

resource "vault_policy" "prometheus" {
  name = "prometheus"

  policy = <<EOT
path "sys/metrics*" {
  capabilities = ["read", "list"]
}
EOT
}
