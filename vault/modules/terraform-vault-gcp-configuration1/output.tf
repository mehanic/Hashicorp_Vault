# Output for GCP Authentication Backend Path
output "gcp_auth_backend_path" {
  description = "The path where the GCP authentication backend is mounted"
  value       = vault_auth_backend.gcp.path
}

# Output for GCP Role
output "gcp_role" {
  description = "The GCP role for authentication"
  value       = vault_gcp_auth_backend_role.gcp_role.role
}

# Output for GCP Token TTL
output "token_ttl" {
  description = "The TTL for tokens created under the GCP role"
  value       = vault_gcp_auth_backend_role.gcp_role.token_ttl
}

# Output for GCP Secrets Backend Path
output "gcp_secrets_backend_path" {
  description = "The path where the GCP secrets backend is mounted"
  value       = vault_gcp_secret_backend.gcp_secret.path
}

# Output for Impersonated Account (if configured)
output "impersonated_account" {
  description = "The impersonated GCP service account"
  value       = vault_gcp_secret_impersonated_account.impersonated.impersonated_account
}

# # Output for Static Service Account (if configured)
# output "static_service_account" {
#   description = "The static GCP service account"
#   value       = vault_gcp_secret_static_account.static.service_account_email
# }
