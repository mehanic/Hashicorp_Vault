# mounting gcp auth backend
resource "vault_auth_backend" "gcp" {
  path = var.gcp_path
  type = "gcp"
}
resource "vault_gcp_auth_backend" "gcp" {
  credentials = var.gcp_credentials
}

resource "vault_gcp_auth_backend_role" "gcp" {
  role           = var.gcp_role_name
  type           = "gce"
  backend        = "gcp"
  bound_projects = var.gcp_bound_projects
  bound_zones    = var.gcp_bound_zones
  token_policies = var.gcp_token_policies
  token_ttl      = var.gcp_token_ttl
  token_max_ttl  = var.gcp_token_max_ttl
}