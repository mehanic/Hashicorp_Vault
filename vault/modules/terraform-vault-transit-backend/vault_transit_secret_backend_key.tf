resource "vault_transit_secret_backend_key" "this" {
  for_each = var.keys
  backend  = vault_mount.this.path
  name     = each.key
}