# Enable 'userpass' authentication backend
resource "vault_auth_backend" "userpass" {
  type = "userpass"
}

# Create a user named 'student' with password 'changeme'
resource "vault_generic_endpoint" "student" {
  depends_on           = [vault_auth_backend.userpass]
  path                 = "auth/userpass/users/student"
  ignore_absent_fields = true

  data_json = jsonencode({
    policies = ["fpe-client", "admins"]
    password = "changeme"
  })
}



# data_json = <<EOT
# {
#   "policies": ["fpe-client", "admins"],
#   "password": "changeme"
# }
# EOT
# }

# Enable 'approle' authentication backend in the 'training' namespace
resource "vault_auth_backend" "approle" {
  depends_on = [vault_namespace.training]
  namespace = vault_namespace.training.path_fq
  type       = "approle"
}

# Create a role named 'test-role' in the 'approle' authentication backend
resource "vault_approle_auth_backend_role" "test_role" {
  depends_on     = [vault_auth_backend.approle]
  backend        = vault_auth_backend.approle.path
  namespace      = vault_namespace.training.path_fq
  role_name      = "test-role"
  token_policies = ["default", "admins"]
}
