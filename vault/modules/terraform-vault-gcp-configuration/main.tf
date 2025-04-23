resource "vault_gcp_auth_backend" "gcp" {
  path                       = var.gcp_auth_backend_path
  identity_token_key         = var.identity_token_key
  identity_token_ttl         = var.identity_token_ttl
  identity_token_audience    = var.identity_token_audience
  service_account_email      = var.service_account_email
}

# Create a GCP Authentication Backend Role
resource "vault_gcp_auth_backend_role" "test" {
  backend                = vault_gcp_auth_backend.gcp.path
  role                   = var.gcp_role_name
  type                   = "iam"
  bound_service_accounts = var.bound_service_accounts
  bound_projects         = var.bound_projects
  token_ttl              = var.token_ttl
  token_max_ttl          = var.token_max_ttl
  token_policies         = var.token_policies
  add_group_aliases      = var.add_group_aliases
}