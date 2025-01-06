# Output the GCP auth backend path
output "gcp_auth_backend_path" {
  description = "The path where the GCP auth backend is mounted"
  value       = vault_auth_backend.gcp.path
}

# Output the credentials used in the GCP auth backend
output "gcp_credentials" {
  description = "The GCP credentials file used by the Vault GCP auth backend"
  value       = var.gcp_credentials
}

# Output the role details for the GCP auth backend role
output "gcp_auth_backend_role" {
  description = "The GCP Auth Backend Role"
  value       = vault_gcp_auth_backend_role.gcp.role
}

# Output the token policies associated with the GCP auth backend role
output "gcp_token_policies" {
  description = "The list of policies applied to the generated tokens"
  value       = var.gcp_token_policies
}

# Output the token TTL settings
output "gcp_token_ttl" {
  description = "The TTL for the generated tokens"
  value       = var.gcp_token_ttl
}

# Output the token max TTL settings
output "gcp_token_max_ttl" {
  description = "The maximum TTL for the generated tokens"
  value       = var.gcp_token_max_ttl
}
