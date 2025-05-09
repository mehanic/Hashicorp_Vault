#------------------------------------------------------------
# Enable the userpass authentication method in the 'admin/test' namespace
#------------------------------------------------------------
resource "vault_auth_backend" "userpass" {
  depends_on = [vault_namespace.test]
  namespace = vault_namespace.test.path
  type      = "userpass"
}

#-----------------------------------------------------------
# Create a user named 'student' with password 'changeme'
#-----------------------------------------------------------
resource "vault_generic_endpoint" "student" {
  depends_on           = [vault_auth_backend.userpass]
  path                 = "auth/userpass/users/student"
  namespace            = vault_namespace.test.path
  ignore_absent_fields = true

  data_json = jsonencode({
    policies = ["tester"]
    password = "changeme"
  })
}
