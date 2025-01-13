output "authority" {
  description = "vault_pki_secret_backend_root_sign_intermediate"
  value       = module.terraform-vault-pki-intermediate-ca.authority
}
