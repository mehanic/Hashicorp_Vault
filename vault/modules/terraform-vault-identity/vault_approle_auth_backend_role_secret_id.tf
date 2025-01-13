resource "vault_approle_auth_backend_role_secret_id" "default" {
  backend   = local.backend_path
  role_name = vault_approle_auth_backend_role.default.role_name
}