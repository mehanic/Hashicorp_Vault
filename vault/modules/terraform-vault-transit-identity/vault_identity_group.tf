
resource "vault_identity_group" "encrypt" {
  name              = "transit-encrypt"
  type              = "internal"
  external_policies = true
  member_entity_ids = local.encrypt_member_entity_ids
}

resource "vault_identity_group" "decrypt" {
  name              = "transit-decrypt"
  type              = "internal"
  external_policies = true
  member_entity_ids = local.decrypt_member_entity_ids
}

data "vault_identity_group" "encrypt" {
  group_id = vault_identity_group.encrypt.id
}

data "vault_identity_group" "decrypt" {
  group_id = vault_identity_group.decrypt.id
}
