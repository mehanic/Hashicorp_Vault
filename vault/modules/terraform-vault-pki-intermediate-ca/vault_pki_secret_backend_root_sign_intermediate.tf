resource "vault_pki_secret_backend_root_sign_intermediate" "this" {
  depends_on = [vault_pki_secret_backend_intermediate_cert_request.this]

  backend = local.parent_authority_path

  csr         = vault_pki_secret_backend_intermediate_cert_request.this.csr
  common_name = vault_pki_secret_backend_intermediate_cert_request.this.common_name
}

