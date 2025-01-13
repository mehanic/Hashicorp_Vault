
resource "vault_ldap_auth_backend_group" "group" {
  groupname = "users"
  policies  = ["ldap_code_sign"]
  backend   = vault_ldap_auth_backend.ldap.path
}
