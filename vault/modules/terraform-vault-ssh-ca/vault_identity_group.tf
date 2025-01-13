resource "vault_identity_group" "users" {
  name = "users"
  member_group_ids = [
    vault_identity_group.ssh_users.id,
    vault_identity_group.userpass_users.id
  ]
  member_entity_ids = [
    vault_identity_entity.kitchen.id
  ]
}

resource "vault_identity_group" "ssh_users" {
  name     = var.ssh_group_name
  policies = [vault_policy.allow_ca.name]
}

resource "vault_identity_group" "userpass_users" {
  name     = var.userpass_group_name
  policies = [vault_policy.allow_changing_password.name]
}
