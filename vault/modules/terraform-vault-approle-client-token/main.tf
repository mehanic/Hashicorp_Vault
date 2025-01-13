# resource "vault_auth_backend" "approle" {
#   type = "approle" # auth method type
#   path = var.mount-path
#   # modify some configurations of userpass
#   tune {
#     max_lease_ttl = var.ttl
#   }

# }
# resource "vault_approle_auth_backend_role" "my_role" {
#   # unique name of the auth backend to configure  
#   backend        = vault_auth_backend.approle.path
#   role_name      = var.role
#   token_policies = ["default", var.policy]

#   # The maximum lifetime for generated tokens in number of seconds
#   #   token_max_ttl = var.token_max_time
#   #   token_ttl = 1600 
#   secret_id_ttl = 120 # duration of secret ID
# }

# # generates secret id
# resource "vault_approle_auth_backend_role_secret_id" "my_secret" {
#   # unique name of the auth backend to configure  
#   backend = vault_auth_backend.approle.path
#   # The name of the role to create the SecretID for
#   role_name = vault_approle_auth_backend_role.my_role.role_name

# }
# # authenticates with role id and secret id
# resource "vault_approle_auth_backend_login" "login" {
#   # The unique path of the Vault backend to log in with  
#   backend = vault_auth_backend.approle.path
#   # The ID of the role to log in with
#   role_id = vault_approle_auth_backend_role.my_role.role_id
#   # The secret ID of the role to log in with
#   secret_id = vault_approle_auth_backend_role_secret_id.my_secret.secret_id
# }