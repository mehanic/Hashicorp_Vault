resource "vault_identity_group" "this" {
  for_each          = var.jumpcloud_group_policy
  name              = lower(each.key)
  type              = "external"
  member_entity_ids = [for k, v in each.value["identities"] : k]
}
