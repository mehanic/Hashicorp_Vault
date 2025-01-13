module "terraform-vault-pki-ca" {
  source            = "../../modules/terraform-vault-pki-ca"
  module_depends_on = []

  root_ca_path                      = "root_ca"
  root_ca_description               = "Root CA"
  root_ca_role_name                 = "root_ca_role"
  root_ca_max_ttl                   = "8760h"
  root_ca_default_lease_ttl_seconds = 94608000
  root_ca_max_ttl_seconds           = 94608000
  root_cert_common_name             = "root_ca"
  root_cert_ttl                     = "315360000"
  root_ca_ou                        = "Platform"
  root_ca_organization              = "Corp"

  vault_allowed_domains = ["corp.local"]
  vault_address         = "https://vault.corp.local:8200"


  conf_auth_ca_path                      = "config_auth_ca"
  conf_auth_ca_description               = "Config auth intermediate CA"
  conf_auth_ca_default_lease_ttl_seconds = 86400
  conf_auth_ca_max_ttl_seconds           = 86400
  conf_auth_ca_backend_role_name         = "int_ca_role"
  conf_auth_ca_max_ttl                   = "365d"
  conf_auth_ca_ttl                       = "365d"
  conf_auth_ca_cert_common_name          = "config_auth_ca"
  conf_auth_ca_cert_ou                   = "Platform"
  conf_auth_ca_cert_organization         = "Corp"
  conf_auth_ca_cert_country              = "US"
  conf_auth_ca_cert_locality             = "San Francisco"

  web_issuer_ca_path              = "web_issuer_ca"
  web_issuer_ca_description       = "ACME intermediate CA"
  web_issuer_ca_backend_role_name = "web_issuer_ca_role"
  web_issuer_ca_ttl               = "720h"
  web_issuer_ca_max_ttl           = "8760h"
  web_issuer_ca_cert_common_name  = "web_issuer_ca"

}
