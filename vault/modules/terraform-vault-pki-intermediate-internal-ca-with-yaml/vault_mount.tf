# Create a mount for the new intermediate
resource "vault_mount" "this" {
  type                      = "pki"
  path                      = "pki_mesh_${var.mesh_name}"
  max_lease_ttl_seconds     = var.maximum_certificate_ttl * 3600
  default_lease_ttl_seconds = var.default_certificate_ttl * 3600
}