# generates secret id
resource "vault_approle_auth_backend_role_secret_id" "my_secret" {
  # unique name of the auth backend to configure  
  backend = vault_auth_backend.approle.path
  # The name of the role to create the SecretID for
  role_name = vault_approle_auth_backend_role.my_role.role_name

}