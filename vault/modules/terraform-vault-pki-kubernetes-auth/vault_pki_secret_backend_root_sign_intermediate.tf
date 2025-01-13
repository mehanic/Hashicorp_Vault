resource "vault_pki_secret_backend_root_sign_intermediate" "short" {
  backend      = vault_mount.pki-root.path
  csr          = vault_pki_secret_backend_intermediate_cert_request.short.csr
  common_name  = "sandbox.mcdevops.dev"
  ou           = "DevOps"
  organization = "McDonald-Devops"
  ttl          = local.default_1y_in_sec
}