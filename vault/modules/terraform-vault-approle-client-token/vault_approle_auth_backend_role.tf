resource "vault_approle_auth_backend_role" "my_role" {
  # unique name of the auth backend to configure  
  backend        = vault_auth_backend.approle.path
  role_name      = var.role
  token_policies = ["default", var.policy]

  # The maximum lifetime for generated tokens in number of seconds
  #   token_max_ttl = var.token_max_time
  #   token_ttl = 1600 
  secret_id_ttl = 120 # duration of secret ID
}