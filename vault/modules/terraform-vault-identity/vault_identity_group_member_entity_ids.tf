resource "vault_identity_group_member_entity_ids" "default" {
  member_entity_ids = [vault_identity_entity.default.id]
  exclusive         = false
  group_id          = vault_identity_group.development.id
}