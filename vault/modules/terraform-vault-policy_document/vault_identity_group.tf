resource "vault_identity_group" "default" {
  name                       = "${local.secret_type}-creds"
  type                       = "internal"
  external_policies          = var.external_policies
  external_member_entity_ids = var.external_member_entity_ids
}
