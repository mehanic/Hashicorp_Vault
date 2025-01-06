variable "token_display_name" {
  description = "(Optional) String containing the token display name."
  type        = string
  default     = "default-token-display-name"
}

variable "token_explicit_max_ttl" {
  description = "(Optional) The explicit max TTL of this token."
  type        = string
  default     = "0"
}

variable "token_metadata" {
  description = "(Optional) Metadata to be set on this token."
  type        = map(any)
  default     = {}
}

# variable "token_namespace" {
#   description = "(Optional) The namespace to provision the resource in."
#   type        = string
#   default     = ""
# }

variable "token_no_default_policy" {
  description = "(Optional) Flag to not attach the default policy to this token."
  type        = bool
  default     = false
}

variable "token_no_parent" {
  description = "(Optional) Flag to create a token without parent."
  type        = bool
  default     = false
}

variable "token_num_uses" {
  description = "(Optional) The number of allowed uses of this token."
  type        = number
  default     = 0
}

variable "token_period" {
  description = "(Optional) The period of this token."
  type        = string
  default     = "0"
}

variable "token_policies" {
  description = "(Optional) List of policies to attach to this token."
  type        = set(string)
  default     = []
}

variable "token_renewable" {
  description = "(Optional) Flag to allow to renew this token."
  type        = bool
  default     = true
}

variable "token_renew_increment" {
  description = "(Optional) The renew increment."
  type        = number
  default     = 0
}

variable "token_renew_min_lease" {
  description = "(Optional) The minimal lease to renew this token."
  type        = number
  default     = 0
}

variable "token_role_name" {
  description = "(Optional) The token role name."
  type        = string
  default     = "default-role-name"
}

variable "token_ttl" {
  description = "(Optional) The TTL period of this token."
  type        = string
  default     = "0"
}
