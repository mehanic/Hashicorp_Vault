# Create a token role to generate a token with policy attached
resource "vault_token_auth_backend_role" "this" {
  role_name        = vault_policy.this.name
  token_period     = var.token_role_ttl * 3600
  allowed_policies = concat([vault_policy.this.name], var.additional_token_policies)
}