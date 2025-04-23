output "gcp_auth_backend_path" {
  description = "The path to the GCP authentication backend in Vault"
  value       = vault_gcp_auth_backend.gcp.path
}

output "gcp_auth_backend_identity_token_key" {
  description = "The identity token key for the GCP authentication backend"
  value       = vault_gcp_auth_backend.gcp.identity_token_key
}



//

output "gcp_auth_backend_role" {
  value = vault_gcp_auth_backend_role.test.role
}