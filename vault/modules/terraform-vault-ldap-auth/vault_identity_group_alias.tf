resource "vault_identity_group_alias" "this" {
  for_each       = var.jumpcloud_group_policy
  canonical_id   = vault_identity_group.this[each.key].id
  mount_accessor = vault_ldap_auth_backend.this.accessor
  name           = lower(each.key)
}
