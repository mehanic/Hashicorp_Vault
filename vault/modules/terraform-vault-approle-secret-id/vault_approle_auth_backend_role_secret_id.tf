resource "vault_approle_auth_backend_role_secret_id" "approle_secret" {
  for_each = vault_approle_auth_backend_role.approle_role

  backend      = each.value.backend
  role_name    = each.value.role_name
  wrapping_ttl = var.wrapping_ttl
}
