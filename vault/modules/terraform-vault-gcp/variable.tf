# GCP Secret Engine

# variable "gcp_credentials" {
#   description = "Credentials for GCP auth Backend"
#   default     = "/home/mehanic/VAULT/9.KV_vault/terraform-vault-onboard-master/gcp/gcp-credentials.json"  # Replace with actual credentials file path
# }

variable "gcp_credentials" {
  description = "Credentials for GCP auth Backend"
  default     = "{\"type\": \"service_account\", \"project_id\": \"your-project-id\", \"private_key_id\": \"your-private-key-id\", \"private_key\": \"-----BEGIN PRIVATE KEY-----\\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCAT4wggE2AgEAAkEAr5OgDbmTTuAZoGyjK0zzxa8W0VptwZGVz2kT2z5BFX9uTu10Al1Z7YeeQsNVnIzXh0u4oX1TmGbBXIUpquzFzqYoAyZefwQpnRExRHY8SlgLgghzW9aauLfU4V9e8tXW2G1uJmZ//osrpQowcQywi8PbVhziXchD/S7NmSg5n8jCh4aV6kPbxGqPsy7R8w==\\n-----END PRIVATE KEY-----\\n\", \"client_email\": \"your-service-account@your-project.iam.gserviceaccount.com\", \"client_id\": \"your-client-id\", \"auth_uri\": \"https://accounts.google.com/o/oauth2/auth\", \"token_uri\": \"https://oauth2.googleapis.com/token\", \"auth_provider_x509_cert_url\": \"https://www.googleapis.com/oauth2/v1/certs\", \"client_x509_cert_url\": \"https://www.googleapis.com/robot/v1/metadata/x509/your-service-account%40your-project.iam.gserviceaccount.com\"}"
}

variable "gcp_role_name" {
  description = "GCP Auth role name"
  default     = "gcp-role" # Default role name for GCP auth
}

variable "gcp_bound_zones" {
  description = "List of zones that a GCE instance must belong to"
  type        = list(string)
  default     = ["us-central1-a", "us-west1-b"] # Example default zones
}

variable "gcp_bound_projects" {
  description = "An array of GCP project IDs to restrict authentication to them"
  type        = list(string)
  default     = ["project-12345", "project-67890"] # Example project IDs
}

variable "gcp_token_policies" {
  description = "List of policies to encode onto generated tokens"
  type        = list(string)
  default     = ["default", "gcp-policy"] # Example policies
}

variable "gcp_token_ttl" {
  description = "Incremental lifetime for generated tokens in number of seconds"
  type        = number
  default     = 3600 # 1 hour TTL
}

variable "gcp_token_max_ttl" {
  description = "Maximum lifetime for generated tokens in number of seconds"
  type        = number
  default     = 86400 # 24 hours maximum TTL
}

variable "gcp_path" {
  type        = string
  default     = "gcp_vault"
  description = "description"
}
