locals {
  encrypt_member_entity_ids = var.encrypt_entity_ids != [] ? var.encrypt_entity_ids : [vault_identity_entity.default.id]
  decrypt_member_entity_ids = var.decrypt_entity_ids != [] ? var.decrypt_entity_ids : [vault_identity_entity.default.id]
}
