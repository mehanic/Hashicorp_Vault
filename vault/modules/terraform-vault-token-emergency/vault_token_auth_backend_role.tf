resource "vault_token_auth_backend_role" "emergency" {
  role_name         = "emergency_seal"
  allowed_policies  = [vault_policy.emergency.name]
  token_bound_cidrs = var.token_bound_cidrs
  orphan            = true
}
