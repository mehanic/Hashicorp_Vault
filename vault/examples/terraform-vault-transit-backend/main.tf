module "terraform-vault-transit-backend" {
  source = "../../modules/terraform-vault-transit-backend"
  type   = "transit"

  path = "transit-backend"

  description = null

  default_lease_ttl = null

  max_lease_ttl = null

  keys = []


}
