output "authority" {
  value       = module.terraform-vault-pki-root-ca.authority
  description = "Return a vault_pki_secret_backend_root_cert object"
}
