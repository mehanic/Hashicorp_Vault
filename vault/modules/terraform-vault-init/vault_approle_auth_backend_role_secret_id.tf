resource "vault_approle_auth_backend_role_secret_id" "cicd-ro" {
  backend   = vault_auth_backend.approle.path
  role_name = vault_approle_auth_backend_role.cicd-ro.role_name
}

resource "vault_approle_auth_backend_role_secret_id" "cicd-rw" {
  backend   = vault_auth_backend.approle.path
  role_name = vault_approle_auth_backend_role.cicd-rw.role_name
}