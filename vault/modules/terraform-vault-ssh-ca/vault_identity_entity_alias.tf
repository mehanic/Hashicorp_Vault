resource "vault_identity_entity_alias" "userpass-kitchen" {
  name           = vault_identity_entity.kitchen.name
  mount_accessor = vault_auth_backend.userpass.accessor
  canonical_id   = vault_identity_entity.kitchen.id
}