# Output for GCP Authentication Backend Path
output "gcp_auth_backend_path" {
  description = "The path where the GCP authentication backend is mounted"
  value       = module.terraform-vault-gcp-configuration1.gcp_auth_backend_path
}

# Output for GCP Role
output "gcp_role" {
  description = "The GCP role for authentication"
  value       = module.terraform-vault-gcp-configuration1.gcp_role
}

# Output for GCP Token TTL
output "token_ttl" {
  description = "The TTL for tokens created under the GCP role"
  value       = module.terraform-vault-gcp-configuration1.token_ttl
}

# Output for GCP Secrets Backend Path
output "gcp_secrets_backend_path" {
  description = "The path where the GCP secrets backend is mounted"
  value       = module.terraform-vault-gcp-configuration1.gcp_secrets_backend_path
}

# Output for Impersonated Account (if configured)
output "impersonated_account" {
  description = "The impersonated GCP service account"
  value       = module.terraform-vault-gcp-configuration1.impersonated_account
}

# # Output for Static Service Account (if configured)
# output "static_service_account" {
#   description = "The static GCP service account"
#   value       = module.terraform-vault-gcp-configuration1.static_service_account
# }
