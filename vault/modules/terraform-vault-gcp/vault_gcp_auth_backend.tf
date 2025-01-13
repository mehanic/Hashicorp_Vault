resource "vault_gcp_auth_backend" "gcp" {
  credentials = var.gcp_credentials
}
