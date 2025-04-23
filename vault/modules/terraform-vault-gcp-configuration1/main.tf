# Enable GCP Authentication Backend
resource "vault_auth_backend" "gcp" {
  path = var.gcp_auth_backend_path
  type = "gcp"
}

# Define Role for GCP Authentication
resource "vault_gcp_auth_backend_role" "gcp_role" {
  backend                = vault_auth_backend.gcp.path  # Linking to the vault_auth_backend.gcp path
  role                   = var.gcp_role_name
  type                   = "iam"
  bound_service_accounts = var.bound_service_accounts
  bound_projects         = var.bound_projects
  token_ttl              = var.token_ttl
  token_max_ttl          = var.token_max_ttl
  token_policies         = var.token_policies
}

# Enable GCP Secrets Backend
resource "vault_gcp_secret_backend" "gcp_secret" {
  path        = var.gcp_secret_path
   credentials             = file(var.gcp_credentials_path)
}

# Create Impersonated Account (Optional)
resource "vault_gcp_secret_impersonated_account" "impersonated" {
  backend                = vault_gcp_secret_backend.gcp_secret.path  # Linking to the gcp_secret path
  impersonated_account   = var.impersonated_account
  service_account_email  = var.static_service_account
}