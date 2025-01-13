output "authority" {
  value       = vault_pki_secret_backend_root_cert.this
  description = "Return a vault_pki_secret_backend_root_cert object"
}
