resource "vault_pki_secret_backend_config_urls" "this" {
  depends_on = [vault_pki_secret_backend_root_cert.this]

  backend = vault_pki_secret_backend_root_cert.this.backend

  issuing_certificates    = [for url in local.urls_prefix : "${url}/v1/${vault_mount.this.path}/ca"]
  crl_distribution_points = [for url in local.urls_prefix : "${url}/v1/${vault_mount.this.path}/crl"]
}
