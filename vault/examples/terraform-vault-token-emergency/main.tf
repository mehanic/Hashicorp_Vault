module "terraform-vault-token-emergency" {
  source            = "../../modules/terraform-vault-token-emergency"
  token_ttl         = "9600h"
  token_bound_cidrs = []


}
