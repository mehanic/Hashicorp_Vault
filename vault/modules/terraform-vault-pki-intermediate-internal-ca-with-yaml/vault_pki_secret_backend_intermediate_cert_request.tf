# Generate the CSR against the intermediate mount
resource "vault_pki_secret_backend_intermediate_cert_request" "this" {
  backend     = vault_mount.this.path
  type        = "internal"
  common_name = "${var.mesh_name} ${local.common_name_suffix}"
  uri_sans = [
    "spiffe://${var.mesh_name}"
  ]
}
