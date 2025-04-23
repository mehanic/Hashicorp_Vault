variable "gcp_auth_backend_path" {
  description = "The path where the GCP authentication backend is mounted"
  type        = string
  default     = "gcp"  # Default path is "gcp"
}

variable "identity_token_key" {
  description = "The identity token key"
  type        = string
  default     = "example-key"
}

variable "identity_token_ttl" {
  description = "The TTL for the identity token in seconds"
  type        = number
  default     = 1800
}

variable "identity_token_audience" {
  description = "The audience for the identity token"
  type        = string
  default     = "<TOKEN_AUDIENCE>"  # Replace with actual audience
}

variable "service_account_email" {
  description = "The GCP service account email"
  type        = string
  default     = "<SERVICE_ACCOUNT_EMAIL>"  # Replace with actual service account email
}

///



# GCP Role Settings
variable "gcp_role_name" {
  description = "The name of the GCP role"
  type        = string
  default     = "test"
}

variable "bound_service_accounts" {
  description = "The list of GCP service accounts allowed to authenticate"
  type        = list(string)
  default     = ["test-service-account@your-project.iam.gserviceaccount.com"]
}

variable "bound_projects" {
  description = "The list of GCP projects allowed to authenticate"
  type        = list(string)
  default     = ["your-gcp-project"]
}

variable "token_ttl" {
  description = "The TTL for tokens created under this role"
  type        = number
  default     = 300
}

variable "token_max_ttl" {
  description = "The maximum TTL for tokens created under this role"
  type        = number
  default     = 600
}

variable "token_policies" {
  description = "The policies to attach to tokens created under this role"
  type        = list(string)
  default     = ["policy_a", "policy_b"]
}

variable "add_group_aliases" {
  description = "Whether to add group aliases to the tokens"
  type        = bool
  default     = true
}