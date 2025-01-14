module "terraform-vault-gcp-configuration" {
  source = "../../modules/terraform-vault-gcp-configuration"

  gcp_auth_backend_path = "gcp-vault"   # Path where the GCP authentication backend is mounted
  identity_token_key    = "example-key" # The identity token key
  identity_token_ttl    = 1800          # TTL for the identity token in seconds
  //identity_token_audience = "your-token-audience"  # Replace with the actual token audience
  //If you're using Vault as the service that expects the token, the audience can be set to the Vault server URL or its specific API endpoint:
  //identity_token_audience = "https://vault.mycompany.com"
  identity_token_audience = "https://iam.googleapis.com/"
  //If you're authenticating to a specific GCP service, the audience would usually be the service's URL or the audience specified in your GCP project settings. For example, if you're authenticating to the GCP API using Vault:
  //If you're using Vault's GCP authentication backend for interacting with GCP, the token audience could be Vault's GCP backend endpoint:
  //identity_token_audience = "https://vault.mycompany.com/v1/auth/gcp/login"
  //In some cases, your audience may be a custom URL or endpoint used for specific services in your application, like this:
  //identity_token_audience = "https://my-application-service.com"

  service_account_email = "your-service-account-email@your-project.iam.gserviceaccount.com" # Replace with the actual GCP service account email

  # GCP Role Name
  gcp_role_name = "test"

  # List of GCP service accounts allowed to authenticate
  bound_service_accounts = [
    "test-service-account@your-project.iam.gserviceaccount.com"
  ]

  # List of GCP projects allowed to authenticate
  bound_projects = [
    "your-gcp-project"
  ]

  # TTL for tokens created under this role (in seconds)
  token_ttl = 300

  # Maximum TTL for tokens created under this role (in seconds)
  token_max_ttl = 600

  # List of policies to attach to tokens created under this role
  token_policies = [
    "policy_a",
    "policy_b"
  ]

  # Whether to add group aliases to the tokens
  add_group_aliases = true

}


# resource "vault_gcp_auth_backend" "gcp" {
#   # Configuration for GCP-specific auth backend
# }

# This resource is GCP-specific and provides more customized configuration options that are specifically
#  tailored for Vault's GCP authentication backend.
# It abstracts some of the underlying complexity by giving you direct access to GCP-related parameters
#  like identity_token_key, identity_token_ttl, and service_account_email, which are specific to GCP 
#  authentication.
# This resource is easier to use and more intuitive if you are specifically working with the GCP
#  authentication backend in Vault.
# Use this approach if you're only working with the GCP authentication backend, as it simplifies 
# the configuration by focusing solely on the GCP-specific settings.

# Use vault_gcp_auth_backend if you are specifically managing the GCP authentication backend
#  and want to simplify your configuration with settings tailored for GCP.

# Pros: Simplified syntax, GCP-specific options available directly.
# Cons: Less flexible if you need to manage other types of authentication backends.

# If you are only working with the GCP authentication backend, use the vault_gcp_auth_backend resource, as it simplifies 
# configuration and provides specific options for GCP.