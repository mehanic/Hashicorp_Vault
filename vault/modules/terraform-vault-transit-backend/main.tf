resource "vault_mount" "this" {
  path                      = var.path
  type                      = var.type
  description               = var.description
  default_lease_ttl_seconds = var.default_lease_ttl
  max_lease_ttl_seconds     = var.max_lease_ttl
}

resource "vault_transit_secret_backend_key" "this" {
  for_each = var.keys
  backend  = vault_mount.this.path
  name     = each.key
}