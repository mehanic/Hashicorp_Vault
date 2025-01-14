# resource "vault_auth_backend" "gcp" {
#   path = "gcp"
#   type = "gcp"
# }

# This is the more generic and standard way to define authentication backends in Vault.
# vault_auth_backend is a general-purpose resource for managing different authentication backends in Vault,
#  not limited to GCP. The type = "gcp" specifies that this backend will be the Google Cloud Platform 
#  (GCP) authentication backend.
# This allows you to use the same vault_auth_backend resource for different types of auth backends 
# (e.g., gcp, approle, ldap, etc.) by specifying the type.
# Use this approach when you need flexibility in managing multiple types of authentication methods
#  within the same Terraform configuration.


#  Use vault_auth_backend with type = "gcp" if you want a generic, 
#  flexible approach where you can easily manage different types of authentication backends in your 
#  Terraform code.

# Pros: Flexible, allows for managing different backends in the same configuration.
# Cons: Requires more configuration as it is more generic.

# If you need greater flexibility or may manage other authentication backends alongside GCP,
#  go with vault_auth_backend and set type = "gcp".

module "terraform-vault-gcp-configuration1" {
  source = "../../modules/terraform-vault-gcp-configuration1"
  # GCP Authentication Backend Variables
  gcp_auth_backend_path  = "vault_auth_backend"
  gcp_role_name          = "test-role"
  bound_service_accounts = ["test-service-account@your-project.iam.gserviceaccount.com"]
  bound_projects         = ["your-gcp-project"]
  token_ttl              = 300
  token_max_ttl          = 600
  token_policies         = ["example-policy"]

  # GCP Secrets Backend Variables
  gcp_secret_path      = "gcp-secrets"
  gcp_project_id       = "concrete-flare-310318"
  gcp_credentials_path = "../../modules/terraform-vault-gcp-configuration1/creds/application_default_credentials.json"

  # GCP Impersonated and Static Accounts
  impersonated_account   = "impersonated-account/your-impersonated-account@your-project.iam.gserviceaccount.com"
  static_service_account = "static-service-account@your-project.iam.gserviceaccount.com"
}