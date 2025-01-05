variable "kv_path" {
  description = "Path where the secrets KV store is mounted."
  //default     = "secrets"
  default     = "secret"
}

variable "owner" {
  description = "Owner of the secrets."
  type        = string
  default     = "peter"
}

variable "secrets" {
  description = "A secret that will be saved in the secrets KV store (it will be JSON encoded)."
  type        = any
  default     = {}
  sensitive   = true
}

variable "capabilities" {
  description = <<EOT
List of permissions to attach to the policy.
See https://www.vaultproject.io/docs/concepts/policies#policies.
EOT
  type        = list(string)
  default     = ["read"]
}
