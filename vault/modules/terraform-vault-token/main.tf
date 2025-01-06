resource "vault_token" "this" {
  display_name      = var.token_display_name
  explicit_max_ttl  = var.token_explicit_max_ttl
  metadata          = var.token_metadata
 // namespace         = var.token_namespace
  no_default_policy = var.token_no_default_policy
  no_parent         = var.token_no_parent
  num_uses          = var.token_num_uses
  period            = var.token_period
  policies = var.token_policies
  renewable         = var.token_renewable
  renew_increment   = var.token_renew_increment
  renew_min_lease   = var.token_renew_min_lease
  role_name = var.token_role_name
  ttl       = var.token_ttl
}

# vault write auth/token/roles/default-role-name \                     
#             allowed_policies="default,example-policy" \
#             orphan=true \
#             period=120h
# Success! Data written to: auth/token/roles/default-role-name

# Explanation:

# my-token-role: Replace this with your intended role name.
# allowed_policies: Policies that this role is allowed to use.
# orphan: Prevents the token from having a parent.
# period: Optional period for renewable tokens.

#terraform output -json token_client_token