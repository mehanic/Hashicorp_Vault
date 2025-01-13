resource "vault_mount" "pki" {
  path                      = "pki1"
  type                      = "pki"
  default_lease_ttl_seconds = 86400
  max_lease_ttl_seconds     = 31536000
}