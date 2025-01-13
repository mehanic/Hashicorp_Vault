resource "vault_identity_entity" "this" {
  for_each = local.identity_map
  name     = lower(each.key)
  disabled = try(each.value["disabled"], false)
}
