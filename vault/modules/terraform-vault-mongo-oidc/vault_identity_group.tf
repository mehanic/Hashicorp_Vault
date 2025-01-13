resource "vault_identity_group" "mongodbuser" {
  name     = var.mongodb_users_groupname
  type     = "external"
  metadata = var.mongodb_users_metadata
  policies = [vault_policy.mongodb_user.name]
}
