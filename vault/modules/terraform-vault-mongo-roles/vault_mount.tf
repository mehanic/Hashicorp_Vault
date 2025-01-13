resource "vault_mount" "database" {
  path                      = var.path   # Path such as "mongo" or a custom value
  type                      = "database" # Use "database" instead of "mongodb"
  description               = var.description
  default_lease_ttl_seconds = var.default_lease_ttl_seconds
  max_lease_ttl_seconds     = var.max_lease_ttl_seconds
}