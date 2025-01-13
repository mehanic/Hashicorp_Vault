resource "vault_approle_auth_backend_role" "approle" {
  backend            = vault_auth_backend.approle.path
  role_name          = var.role_name
  token_policies     = ["default", var.approle_sign_policy_name]
  secret_id_ttl      = "600"
  token_num_uses     = "10"
  token_ttl          = "1200"
  token_max_ttl      = "1800"
  secret_id_num_uses = "40"
}
