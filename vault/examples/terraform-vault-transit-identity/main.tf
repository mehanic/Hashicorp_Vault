module "terraform-vault-transit-identity" {
  source             = "../../modules/terraform-vault-transit-identity"
  encrypt_entity_ids = []

  decrypt_entity_ids = []

  path = "transit-vault"


}
