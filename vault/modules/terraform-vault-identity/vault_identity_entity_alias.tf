resource "vault_identity_entity_alias" "default" {
  name           = local.role_id
  mount_accessor = local.mount_accessor
  canonical_id   = vault_identity_entity.default.id
}
