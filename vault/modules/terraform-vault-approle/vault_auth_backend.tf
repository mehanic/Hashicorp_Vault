resource "vault_auth_backend" "approle" {
  type        = "approle"
  path        = var.approle_path
  description = "AppRole managed by Terraform"
  tune {
    default_lease_ttl = var.default_lease_ttl_seconds
    max_lease_ttl     = var.max_lease_ttl_seconds
  }
}