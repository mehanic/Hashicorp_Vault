

# Secret type for the Vault configuration
variable "secret_type" {
  description = "The type of secrets engine to be used."
  type        = string
  default     = "secret"
}

# Configuration for enabling or disabling external policies for identity groups
variable "external_policies" {
  description = "Flag to enable or disable external policies for identity groups."
  type        = bool
  default     = true
}

# Configuration for enabling or disabling external member entity IDs
variable "external_member_entity_ids" {
  description = "Flag to enable or disable external member entity IDs."
  type        = bool
  default     = true
}
