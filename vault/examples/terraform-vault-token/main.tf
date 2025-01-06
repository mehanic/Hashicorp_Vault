module "terraform-vault-token" {
  source         = "../../modules/terraform-vault-token"
  # Terraform variables for Vault token resource

token_display_name     = "my-token-display-name"       # Customize the token display name
token_explicit_max_ttl = "3600"                        # Set explicit max TTL (in seconds)
token_metadata         = { "environment" = "dev" }     # Example metadata
token_no_default_policy = false                        # Whether to exclude the default policy
token_no_parent        = false                         # Create token without parent
token_num_uses         = 5                             # Maximum number of uses for the token
token_period           = "0"                           # Set to "0" if no specific period
token_policies         = ["default", "example-policy"]      # List of policies for the token
token_renewable        = true                          # Allow token renewal
token_renew_increment  = 0                             # Increment for renewals
token_renew_min_lease  = 0                             # Minimum lease time for renewals
token_role_name        = "my-token-role"               # Must match an existing role in Vault
token_ttl              = "3600"                        # TTL for the token (in seconds)

  
}
