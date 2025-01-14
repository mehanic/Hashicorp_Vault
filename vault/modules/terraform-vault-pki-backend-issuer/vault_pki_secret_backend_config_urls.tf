resource "vault_pki_secret_backend_config_urls" "root" {
  for_each                = var.pki_map
  backend                 = vault_mount.root[each.key].path
  issuing_certificates    = try(each.value["issuing_certificates"], null)
  crl_distribution_points = try(each.value["crl_distribution_points"], null)
}


resource "vault_pki_secret_backend_config_urls" "intermediate" {
  for_each             = local.inter_list
  backend              = vault_mount.intermediate[each.key].path
  issuing_certificates = try(each.value["issuing_certificates"], null)
}
