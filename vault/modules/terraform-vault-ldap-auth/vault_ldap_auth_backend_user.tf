resource "vault_ldap_auth_backend_user" "user" {
  for_each = local.identity_map
  username = each.key
  policies = each.value["policies"] # Now policies are available in each.value
  backend  = vault_ldap_auth_backend.this.path
}
