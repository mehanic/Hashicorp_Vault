resource "vault_identity_entity_alias" "this" {
  for_each       = local.identity_map
  canonical_id   = vault_identity_entity.this[each.key].id
  mount_accessor = vault_ldap_auth_backend.this.accessor
  name           = lower(each.key)
}
