variable "ssh_mount_path" {
  description = "The path for the SSH secret backend mount"
  type        = string
  default     = "sshca"
}

variable "ssh_ca_description" {
  description = "The description for the SSH Certificate Authority backend"
  type        = string
  default     = "kitchen's awesome ssh certificate authority"
}

variable "default_lease_ttl_seconds" {
  description = "Default TTL for leases in seconds (1 week)"
  type        = number
  default     = 604800
}

variable "max_lease_ttl_seconds" {
  description = "Max TTL for leases in seconds (30 days)"
  type        = number
  default     = 2592000
}

variable "generate_signing_key" {
  description = "Whether to generate a signing key for the SSH CA"
  type        = bool
  default     = true
}

variable "ssh_group_name" {
  description = "The name of the SSH identity group"
  type        = string
  default     = "ssh_users"
}

variable "ssh_policy_name" {
  description = "The name of the policy for SSH users"
  type        = string
  default     = "allow_ca"
}

variable "userpass_group_name" {
  description = "The name of the userpass identity group"
  type        = string
  default     = "userpass_users"
}

variable "userpass_policy_name" {
  description = "The name of the policy for userpass users"
  type        = string
  default     = "allow_changing_password"
}

variable "kitchen_entity_name" {
  description = "The entity name for the kitchen user"
  type        = string
  default     = "kitchen"
}

variable "kitchen_role_name" {
  description = "The name of the SSH secret backend role for kitchen"
  type        = string
  default     = "kitchen"
}

variable "allowed_users" {
  description = "The allowed users for the kitchen role"
  type        = string
  default     = "kitchen"
}

variable "default_user" {
  description = "The default user for the kitchen role"
  type        = string
  default     = "kitchen"
}

variable "default_extensions" {
  description = "Default SSH extensions for the kitchen role"
  type        = map(string)
  default = {
    "permit-port-forwarding"  = "",
    "permit-pty"              = "",
    "permit-agent-forwarding" = "",
  }
}

variable "key_type" {
  description = "The key type for SSH certificates"
  type        = string
  default     = "ca"
}

variable "allow_user_certificates" {
  description = "Whether to allow user certificates"
  type        = bool
  default     = true
}
