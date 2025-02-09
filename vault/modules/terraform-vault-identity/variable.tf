variable "application_name" {
  description = "Name of the application/customer"
  type        = string
  default     = "development-secret"
}

variable "env" {
  description = "The environment name the identity principal will operate in"
  type        = string
  default     = "dev"
}

variable "service" {
  description = "The name of the service attached to the principal approle"
  type        = string
  default     = "platform"
}

variable "mount_accessor" {
  description = "The Accessor ID of the Approle Auth Backend."
  type        = string
  default     = "auth_approle_6d1f132c" //vault auth list
}

variable "identity_group_id" {
  description = "ID of Vault Identity Group to which a vault policy is bound to"
  type        = string
  sensitive   = true
  default     = "development"
}