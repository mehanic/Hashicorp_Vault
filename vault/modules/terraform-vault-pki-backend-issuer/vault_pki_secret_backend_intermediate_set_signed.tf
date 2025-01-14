resource "vault_pki_secret_backend_intermediate_set_signed" "intermediate" {
  for_each    = local.inter_list
  backend     = vault_mount.intermediate[each.key].path
  certificate = vault_pki_secret_backend_root_sign_intermediate.intermediate[each.key].certificate
}
