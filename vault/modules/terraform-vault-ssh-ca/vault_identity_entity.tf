resource "vault_identity_entity" "kitchen" {
  name     = var.kitchen_entity_name
  policies = ["default"]
}