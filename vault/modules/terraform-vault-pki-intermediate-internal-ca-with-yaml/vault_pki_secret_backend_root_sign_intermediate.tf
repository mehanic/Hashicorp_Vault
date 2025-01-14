# Get Root CA to generate certificate from CSR
resource "vault_pki_secret_backend_root_sign_intermediate" "this" {
  backend = var.root_ca_mount_path

  common_name = "${var.mesh_name} ${local.common_name_suffix}"
  csr         = vault_pki_secret_backend_intermediate_cert_request.this.csr
  format      = "pem"
}
