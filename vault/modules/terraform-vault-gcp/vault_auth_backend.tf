resource "vault_auth_backend" "gcp" {
  path = var.gcp_path
  type = "gcp"
}