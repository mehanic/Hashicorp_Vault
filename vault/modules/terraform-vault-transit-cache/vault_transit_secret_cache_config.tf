//vault write transit/vault/config/cache enabled=true
//
resource "vault_transit_secret_cache_config" "transit" {
  backend = vault_mount.transit.path
  size    = var.transit_cache_size

  depends_on = [
    vault_mount.transit
  ]

}