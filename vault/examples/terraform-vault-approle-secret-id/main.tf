module "terraform-vault-approle-secret-id" {
  source = "../../modules/terraform-vault-approle-secret-id"
  backend_paths = {
    approle = "approle-vault"
  }

  name = "aws-vault"

  named_rules = []

  rules = []

  token_ttl     = 72000
  token_max_ttl = 72000
  wrapping_ttl  = 3600

  enable_approle_login = true

}
