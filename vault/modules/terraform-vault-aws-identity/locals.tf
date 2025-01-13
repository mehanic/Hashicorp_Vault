locals {
  member_group_ids = var.group_ids != [] ? var.group_ids : [vault_identity_group.placeholder.id]
}