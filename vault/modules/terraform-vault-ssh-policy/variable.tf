variable "module_depends_on" {
  description = "The module dependencies"
  type        = any
  default     = null
}

variable "ssh_secret_path" {
  description = "The path to the SSH secret backend"
  type        = string
  default     = "ssh"
}

variable "ssh_backend_role_name" {
  description = "The name of the SSH backend role"
  type        = string
  default     = "ssh_backend_role"
}

variable "ttl" {
  description = "The TTL for the SSH backend role"
  type        = string
  default     = "30m0s"
}

variable "default_extensions" {
  description = "The default extensions for the SSH backend role"
  type        = map(string)
  default     = {
    "permit-pty" = ""
  }     
}

variable "default_user" {
  description = "The default user for the SSH backend role"
  type        = string
  default     = "core"
}

variable "allowed_users" {
  description = "The allowed users for the SSH backend role"
  type        = string
  default     = "*"
}

variable "allowed_extensions" {
  description = "The allowed extensions for the SSH backend role"
  type        = string
  default     = "permit-pty"
}

variable "algorithm_signer" {
  description = "The algorithm used to sign the SSH backend role"
  type        = string
  default     = "rsa-sha2-256"
}