resource "vault_pki_secret_backend_root_cert" "root" {
  for_each     = var.pki_map
  issuer_name  = each.key
  backend      = vault_mount.root[each.key].path
  type         = "internal"
  ttl          = try(each.value["ttl"], null)
  common_name  = try(each.value["common_name"], null)
  organization = try(each.value["organization"], null)
  ou           = try(each.value["ou"], null)
  country      = try(each.value["country"], null)
  locality     = try(each.value["locality"], null)
  province     = try(each.value["province"], null)
}