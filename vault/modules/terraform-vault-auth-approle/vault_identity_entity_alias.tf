resource "vault_identity_entity_alias" "approle_identity_alias" {
  depends_on     = [vault_identity_entity.approle_identity]
  for_each       = { for role in var.approles : role.role_name => role if coalesce(role.create_identity, local.default_create_identity) }
  name           = each.value.role_name
  mount_accessor = var.approle_mount_accessor
  canonical_id   = vault_identity_entity.approle_identity[each.value.role_name].id
}
