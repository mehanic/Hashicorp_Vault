resource "vault_identity_entity" "default" {
  name = "transit-identity-default"
  metadata = {
    env     = "dev"
    service = "example"
  }
}