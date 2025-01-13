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
