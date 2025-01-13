resource "vault_approle_auth_backend_role" "default" {
  backend   = local.backend_path
  role_name = local.role_id
  role_id   = local.role_id
  depends_on = [
    vault_identity_entity_alias.default,
  ]
}