resource "vault_token" "this" {
  role_name = vault_token_auth_backend_role.this.role_name

  policies = [vault_policy.this.id]

  renewable         = var.renewable
  ttl               = var.ttl
  no_parent         = var.no_parent
  no_default_policy = var.no_default_policy
  explicit_max_ttl  = var.explicit_max_ttl
  display_name      = var.display_name
  num_uses          = var.num_uses
  period            = var.period
  renew_min_lease   = var.renew_min_lease
  renew_increment   = var.renew_increment
}
