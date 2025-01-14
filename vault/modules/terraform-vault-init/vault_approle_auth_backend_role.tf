resource "vault_approle_auth_backend_role" "cicd-ro" {
  backend        = vault_auth_backend.approle.path
  role_name      = "cicd-ro"
  token_policies = [vault_policy.cicd-ro.name]

  # AppRole security configuration
  token_ttl             = 3600
  token_max_ttl         = 14400
  token_num_uses        = 0
  secret_id_ttl         = 300
  secret_id_num_uses    = 0
  bind_secret_id        = true
  secret_id_bound_cidrs = var.ip_whitelist
  token_bound_cidrs     = var.ip_whitelist
}


resource "vault_approle_auth_backend_role" "cicd-rw" {
  backend        = vault_auth_backend.approle.path
  role_name      = "cicd-rw"
  token_policies = [vault_policy.cicd-rw.name]

  # AppRole security configuration
  token_ttl             = 3600
  token_max_ttl         = 14400
  token_num_uses        = 0
  secret_id_ttl         = 1800
  secret_id_num_uses    = 0
  bind_secret_id        = true
  secret_id_bound_cidrs = var.ip_whitelist
  token_bound_cidrs     = var.ip_whitelist
}