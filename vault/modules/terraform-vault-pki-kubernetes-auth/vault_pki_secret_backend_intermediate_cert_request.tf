resource "vault_pki_secret_backend_intermediate_cert_request" "short" {
  backend     = vault_mount.pki-short.path
  type        = "internal"
  common_name = "sandbox.mcdevops.dev"
}
