output "gcp_auth_backend_path" {
  description = "The path to the GCP authentication backend in Vault"
  value       = module.terraform-vault-gcp-configuration.gcp_auth_backend_path
}

output "gcp_auth_backend_identity_token_key" {
  description = "The identity token key for the GCP authentication backend"
  value       = module.terraform-vault-gcp-configuration.gcp_auth_backend_identity_token_key
}


output "gcp_auth_backend_role" {
  value = module.terraform-vault-gcp-configuration.gcp_auth_backend_role
}