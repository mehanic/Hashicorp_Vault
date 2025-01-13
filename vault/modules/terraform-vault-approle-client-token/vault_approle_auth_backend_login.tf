# authenticates with role id and secret id
resource "vault_approle_auth_backend_login" "login" {
  # The unique path of the Vault backend to log in with  
  backend = vault_auth_backend.approle.path
  # The ID of the role to log in with
  role_id = vault_approle_auth_backend_role.my_role.role_id
  # The secret ID of the role to log in with
  secret_id = vault_approle_auth_backend_role_secret_id.my_secret.secret_id
}