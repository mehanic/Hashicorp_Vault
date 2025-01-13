resource "vault_identity_oidc_assignment" "this" {
  for_each = var.jumpcloud_group_policy
  name     = lower(each.key)
  entity_ids = concat(
    [for k, v in each.value["identities"] : vault_identity_entity_alias.this[k].id],
  )
  group_ids = [
    vault_identity_group_alias.this[each.key].id,
  ]
}