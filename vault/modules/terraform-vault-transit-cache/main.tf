resource "vault_mount" "transit" {
  path = var.path
  type = "transit"

  default_lease_ttl_seconds = var.default_lease
  max_lease_ttl_seconds     = var.max_lease

  seal_wrap               = var.seal_wrap
  local                   = var.local_mount
  external_entropy_access = var.external_entropy_access

}
//vault write transit/vault/config/cache enabled=true
//
resource "vault_transit_secret_cache_config" "transit" {
  backend = vault_mount.transit.path
  size    = var.transit_cache_size

  depends_on = [
    vault_mount.transit
  ]

}

resource "vault_transit_secret_backend_key" "transit" {
  for_each = {
    for key in var.transit_keys :
    key.name => key
  }

  backend = vault_mount.transit.path

  name                   = each.value["name"]
  type                   = each.value["type"]
  deletion_allowed       = each.value["deletion_allowed"]
  derived                = each.value["derived"]
  convergent_encryption  = each.value["convergent_encryption"]
  exportable             = each.value["exportable"]
  allow_plaintext_backup = each.value["allow_plaintext_backup"]
  min_decryption_version = each.value["min_decryption_version"]
  min_encryption_version = each.value["min_encryption_version"]

  depends_on = [
    vault_mount.transit
  ]
}


#  Error: error reading transit cache-config: Error making API request.
# │ 
# │ URL: GET http://127.0.0.1:8200/v1/transit-vault/cache-config
# │ Code: 500. Errors:
# │ 
# │ * 1 error occurred:
# │ 	* caching is disabled for this transit mount
# │ 
