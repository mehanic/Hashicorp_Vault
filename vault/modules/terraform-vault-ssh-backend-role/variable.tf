variable "ssh_mount_path" {
  description = "The path for the SSH secrets engine mount"
  type        = string
  default     = "ssh_signed_keys_vault"
}

variable "client_keys_role_name" {
  description = "The name of the SSH secret backend role"
  type        = string
  default     = "client_keys"
}

variable "key_type" {
  description = "The type of key used for signing (ca, user)"
  type        = string
  default     = "ca"
}

variable "allow_host_certificates" {
  description = "Whether to allow host certificates"
  type        = bool
  default     = false
}

variable "allow_subdomains" {
  description = "Whether to allow subdomains"
  type        = bool
  default     = false
}

variable "allow_user_key_ids" {
  description = "Whether to allow user key IDs"
  type        = bool
  default     = false
}

variable "allow_user_certificates" {
  description = "Whether to allow user certificates"
  type        = bool
  default     = true
}

variable "default_extensions" {
  description = "Default SSH extensions"
  type        = map(string)
  default = {
    "permit-pty" = ""
  }
}

variable "allowed_extensions" {
  description = "Allowed SSH extensions"
  type        = string
  default     = "permit-pty,permit-port-forwarding"
}

variable "default_user" {
  description = "The default user for SSH certificates"
  type        = string
  default     = "martin"
}

variable "allowed_users" {
  description = "The allowed users for SSH certificates"
  type        = string
  default     = "martin,ubuntu"
}

variable "max_ttl" {
  description = "Maximum TTL for the SSH key"
  type        = string
  default     = "30m"
}

variable "ttl" {
  description = "TTL for the SSH key"
  type        = string
  default     = "10m"
}

variable "cidr_list" {
  description = "The CIDR list for allowed IPs"
  type        = string
  default     = "172.16.0.0/16"
}
