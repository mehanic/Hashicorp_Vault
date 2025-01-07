
module "terraform-vault-transit" {
  source = "../../modules/terraform-vault-transit"
  # Terraform variables for Vault token resource
  transit_keys = [
    {
      name             = "key1"
      deletion_allowed = true
      type             = "aes256-gcm96"
    }
  ]
  transit_path = "transit"
  kv_path      = "secret"

}


