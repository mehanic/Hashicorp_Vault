module "terraform-vault-pki-intermediate-ca" {
  source      = "../../modules/terraform-vault-pki-intermediate-ca"
  name        = "intermediate-certificate"                      # The name of the intermediate certificate
  parent_ca   = "intermediate-certificate"                      # The name or reference to the parent CA
  description = "Intermediate CA for issuing leaf certificates" # Add a relevant description
  path        = "/pki/intermediate"                             # Path where the intermediate certificate will be used or stored
  urls_prefix = [
    "https://pki.example.com/intermediate", # URL prefix for intermediate certificate access
    "https://vault.example.com/intermediate"
  ]


}

//  vault read intermediate-certificate/root/certificate
//  vault write intermediate-certificate/root/generate/internal common_name="Root CA"  ttl="8760h"  # 1 year TTL
//  execute module terraform-vault-pki-intermediate-ca
#   vault read intermediate-certificate/config/issuers                                     

# Key                              Value
# ---                              -----
# default                          09123f34-4eda-e356-98d6-50f5737271eb
# default_follows_latest_issuer    false
