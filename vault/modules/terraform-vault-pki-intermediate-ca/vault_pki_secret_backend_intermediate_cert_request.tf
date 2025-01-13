# Create a CSR that will be signed from parent CA
resource "vault_pki_secret_backend_intermediate_cert_request" "this" {
  depends_on = [vault_mount.this]

  backend = vault_mount.this.path

  type        = "internal"
  common_name = vault_mount.this.description
}

