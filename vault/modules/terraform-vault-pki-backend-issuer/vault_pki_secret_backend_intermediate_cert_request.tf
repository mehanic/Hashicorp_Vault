resource "vault_pki_secret_backend_intermediate_cert_request" "intermediate" {
  for_each    = local.inter_list
  backend     = vault_mount.intermediate[each.key].path
  type        = vault_pki_secret_backend_root_cert.root[each.value["root"]].type
  common_name = try(each.value["common_name"], null)
}
