variable "backend" {
  default = "kubernetes-vault"
}

variable "name" {
  default = "kubernetes"
}

variable "audience" {
  default = "vault"
}

variable "token_ttl" {
  default = null
}

variable "token_max_ttl" {
  default = null
}

variable "bound_service_account_names" {
  description = "The service account names for Kubernetes auth"
  type        = list(string)
  default     = ["first"]
}

variable "bound_service_account_namespaces" {
  default = ["default"]
}

variable "policies" {
  type    = list(string)
  default = []
}

variable "policy_definitions" {
  type    = list(string)
  default = []
}



variable "auth_path" {
  description = "(Optional) The path to mount the auth method — this defaults to 'kubernetes'."
  type        = string
  default     = "kubernetes"
}

variable "disable_remount" {
  description = "(Optional) If set, opts out of mount migration on path updates."
  type        = bool
  default     = false
}

variable "description" {
  description = "(Optional) A description of the auth method."
  type        = string
  default     = "Kubernetes Auth Method"
}

variable "local" {
  description = "(Optional) Specifies if the auth method is local only."
  type        = bool
  default     = false
}

variable "tune_default_lease_ttl" {
  description = "(Optional) Specifies the default time-to-live for tokens."
  type        = string
  default     = null
}

variable "tune_max_lease_ttl" {
  description = "(Optional) Specifies the maximum time-to-live for tokens."
  type        = string
  default     = null
}

variable "audit_non_hmac_response_keys" {
  description = "(Optional) List of keys not to be HMAC'd in the response."
  type        = list(string)
  default     = []
}

variable "audit_non_hmac_request_keys" {
  description = "(Optional) List of keys not to be HMAC'd in the request."
  type        = list(string)
  default     = []
}

variable "listing_visibility" {
  description = "(Optional) Specifies whether to show this mount in the UI-specific listing."
  type        = string
  default     = null
}

variable "passthrough_request_headers" {
  description = "(Optional) Headers to whitelist and pass from request to backend."
  type        = list(string)
  default     = []
}

variable "allowed_response_headers" {
  description = "(Optional) Headers to allow in the plugin response."
  type        = list(string)
  default     = []
}

variable "token_type" {
  description = "(Optional) Specifies the type of tokens returned by the mount."
  type        = string
  default     = null
}


//
variable "kubernetes_host" {
  description = "The URL of the Kubernetes API server."
  type        = string
  default     = "https://kubernetes.default.svc" # Default Kubernetes API URL for most Kubernetes clusters
}

variable "kubernetes_ca_cert" {
  description = "The Kubernetes CA certificate to use when verifying the Kubernetes API server."
  type        = string
  default     = "-----BEGIN CERTIFICATE-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAzF5Dd97TnZZ2SZ7EcxuD\n-----END CERTIFICATE-----" # Example CA Cert (replace with real)
}

variable "token_reviewer_jwt" {
  description = "JWT token for Vault to use as a token reviewer for validating Kubernetes service account tokens."
  type        = string
  default     = "eyJhbGciOiJSUzI1NiIsImtpZCI6IjEwMjY2NTMyMSIsIng1YyI6IjMiLCJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImtpZCI6IjEwMjY2NTMyMSIsIng1YyI6IjMiLCJ0eXAiOiJKV1Qi" # Example JWT token (replace with real)
}

variable "issuer" {
  description = "Issuer value used to validate the Kubernetes JWT token."
  type        = string
  default     = "kubernetes" # Default issuer used in Kubernetes token validation
}

variable "disable_iss_validation" {
  description = "Disable validation of the 'iss' claim in the Kubernetes service account tokens."
  type        = bool
  default     = false # Default is false, meaning the 'iss' claim will be validated
}



//
# variable "kubernetes_secret_backend_path" {
#   type        = string
#   default     = "kubernetes/secrets"
#   description = "The path to mount the Kubernetes secrets engine in Vault."
# }

variable "kubernetes_secret_backend_description" {
  type        = string
  default     = "Kubernetes secrets engine to manage Kubernetes secrets."
  description = "A description of the Kubernetes secrets engine in Vault."
}

variable "default_lease_ttl_seconds" {
  type        = string
  default     = "43200" # Default TTL is 12 hours (in seconds)
  description = "Default TTL for Kubernetes secrets in seconds."
}

variable "max_lease_ttl_seconds" {
  type        = string
  default     = "86400" # Maximum TTL is 24 hours (in seconds)
  description = "Maximum TTL for Kubernetes secrets in seconds."
}

variable "service_account_jwt" {
  type        = string
  default     = "eyJhbGciOiJSUzI1NiIsImtpZCI6IjEwMjY2NTMyMSIsIng1YyI6IjMiLCJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImtpZCI6IjEwMjY2NTMyMSIsIng1YyI6IjMiLCJ0eXAiOiJKV1Qi" # Replace with actual JWT
  description = "JWT for the Kubernetes service account to be used with the Kubernetes secrets engine."
}

variable "disable_local_ca_jwt" {
  type        = string
  default     = "false" # Default is 'false' meaning the local CA JWT is enabled
  description = "Flag to disable local CA JWT. Set to 'true' to disable local CA JWT, 'false' to enable."
}


//


variable "service_account_name" {
  type        = string
  default     = "test-service-account-with-generated-token"
  description = "The name of the service account."
}

variable "kubernetes_namespace" {
  type        = string
  default     = "default"
  description = "The namespace where the service account is created."
}


variable "token_default_ttl" {
  type        = string
  default     = "21600"
  description = "Default TTL for the Kubernetes token."
}

variable "kubernetes_role_name" {
  description = "The name of the Kubernetes role."
  type        = string
  default     = "vault-k8s-secrets-role"
}