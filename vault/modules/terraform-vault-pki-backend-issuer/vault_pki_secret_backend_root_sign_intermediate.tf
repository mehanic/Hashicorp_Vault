resource "vault_pki_secret_backend_root_sign_intermediate" "intermediate" {
  for_each             = local.inter_list
  backend              = vault_mount.root[each.value["root"]].path
  csr                  = vault_pki_secret_backend_intermediate_cert_request.intermediate[each.key].csr
  common_name          = try(each.value["common_name"], null)
  exclude_cn_from_sans = try(each.value["exclude_cn_from_sans"], null)
  organization         = try(each.value["organization"], null)
  ou                   = try(each.value["ou"], null)
  country              = try(each.value["country"], null)
  locality             = try(each.value["locality"], null)
  province             = try(each.value["province"], null)
  revoke               = try(each.value["revoke"], true)
}
