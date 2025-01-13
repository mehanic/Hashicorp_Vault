
resource "vault_identity_group_policies" "encrypt" {
  group_id  = vault_identity_group.encrypt.id
  exclusive = false
  policies = [
    "default",
    vault_policy.encrypt.name,
  ]
}

resource "vault_identity_group_policies" "decrypt" {
  group_id  = vault_identity_group.decrypt.id
  exclusive = false
  policies = [
    "default",
    vault_policy.decrypt.name,
  ]
}
