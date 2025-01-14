resource "vault_generic_endpoint" "admin_user" {
  depends_on           = [vault_auth_backend.userpass]
  path                 = "auth/userpass/users/admin"
  ignore_absent_fields = true

  data_json = jsonencode({
    token_policies    = [vault_policy.admin.name]
    password          = var.admin_password
    token_ttl         = "1h"
    token_bound_cidrs = var.ip_whitelist
  })
}

resource "vault_generic_endpoint" "devops_user" {
  depends_on           = [vault_auth_backend.userpass]
  path                 = "auth/userpass/users/devops"
  ignore_absent_fields = true

  data_json = jsonencode({
    token_policies    = [vault_policy.devops.name]
    password          = var.devops_password
    token_ttl         = "1h"
    token_bound_cidrs = var.ip_whitelist
  })
}
