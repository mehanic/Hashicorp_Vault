# GCP Authentication Backend Variables
variable "gcp_auth_backend_path" {
  description = "The path where the GCP authentication backend is mounted"
  type        = string
  default     = "gcp"
}

variable "gcp_role_name" {
  description = "The name of the GCP role"
  type        = string
  default     = "test-role"
}

variable "bound_service_accounts" {
  description = "List of GCP service accounts that are bound to this role"
  type        = list(string)
  default     = ["test-service-account@your-project.iam.gserviceaccount.com"]
}

variable "bound_projects" {
  description = "List of GCP projects that are bound to this role"
  type        = list(string)
  default     = ["your-gcp-project"]
}

variable "token_ttl" {
  description = "TTL for tokens created under this role"
  type        = number
  default     = 300
}

variable "token_max_ttl" {
  description = "Maximum TTL for tokens created under this role"
  type        = number
  default     = 600
}

variable "token_policies" {
  description = "List of policies attached to the generated tokens"
  type        = list(string)
  default     = ["example-policy"]
}

variable "gcp_secret_path" {
  description = "Path for the GCP secrets backend"
  type        = string
  default     = "gcp-secrets"
}

variable "gcp_project_id" {
  description = "GCP project ID where the secrets will be managed"
  type        = string
  default     = "your-gcp-project"
}

variable "gcp_credentials_path" {
  description = "Path to the GCP service account credentials file"
  type        = string
  default     = "../../modules/terraform-vault-gcp-configuration1/creds/application_default_credentials.json"
}

variable "impersonated_account" {
  description = "The GCP impersonated service account"
  type        = string
  default     = "your-impersonated-account@your-project.iam.gserviceaccount.com"
}

variable "static_service_account" {
  description = "The GCP static service account"
  type        = string
  default     = "static-service-account@your-project.iam.gserviceaccount.com"
}
