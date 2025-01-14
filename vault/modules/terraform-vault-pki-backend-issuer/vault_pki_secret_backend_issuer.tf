resource "vault_pki_secret_backend_issuer" "root" {
  for_each    = var.pki_map
  backend     = vault_pki_secret_backend_root_cert.root[each.key].backend
  issuer_ref  = vault_pki_secret_backend_root_cert.root[each.key].issuer_id
  issuer_name = each.key
}
