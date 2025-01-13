

resource "vault_transit_secret_backend_key" "key" {
  for_each               = { for key in var.transit_keys : key.name => key }
  backend                = vault_mount.transit[0].path
  name                   = each.value.name
  exportable             = false
  allow_plaintext_backup = false
  deletion_allowed       = coalesce(each.value.deletion_allowed, false)
  type                   = each.value.type
}