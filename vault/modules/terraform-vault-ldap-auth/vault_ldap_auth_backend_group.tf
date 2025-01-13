resource "vault_ldap_auth_backend_group" "this" {
  for_each  = var.jumpcloud_group_policy
  groupname = each.key
  policies  = each.value["policies"]
  backend   = vault_ldap_auth_backend.this.path
}