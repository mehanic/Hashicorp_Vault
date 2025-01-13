resource "vault_identity_entity" "default" {
  name = local.role_id
  metadata = {
    env         = local.env
    service     = local.service
    application = local.application
  }
}