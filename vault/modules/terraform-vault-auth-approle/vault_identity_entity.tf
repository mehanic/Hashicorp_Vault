resource "vault_identity_entity" "approle_identity" {
  for_each = { for role in var.approles : role.role_name => role if coalesce(role.create_identity, local.default_create_identity) }
  name     = each.value.role_name
  metadata = each.value.identity_metadata
}