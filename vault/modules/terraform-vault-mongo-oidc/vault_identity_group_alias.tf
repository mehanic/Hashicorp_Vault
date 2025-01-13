resource "vault_identity_group_alias" "default" {
  name           = var.oidc_group_alias_name
  mount_accessor = var.oidc_mount_accessor
  canonical_id   = vault_identity_group.mongodbuser.id
}
