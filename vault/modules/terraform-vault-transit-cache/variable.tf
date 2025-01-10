
variable "path" {
  type        = string
  default     = "transit-vault"
  description = "(Required) The path that the secrets engine will be mounted to."
}

variable "default_lease" {
  type        = number
  default     = 3600
  description = "(Optional) Default lease for all secrets engines."
}

variable "max_lease" {
  type        = number
  default     = 3600
  description = "(Optional) Maximum lease for all secrets engines."
}

variable "seal_wrap" {
  type        = bool
  default     = true
  description = "(Optional) Enable seal wrapping for secrets engines."
}

variable "local_mount" {
  type        = bool
  default     = true
  description = "(Optional) Boolean flag that can be explicitly set to true to enforce local mount in HA environment."
}

variable "external_entropy_access" {
  type        = bool
  default     = false
  description = "(Optional) Boolean flag that can be explicitly set to true to enable the secrets engine to access Vault's external entropy source."
}

variable "transit_cache_size" {
  type        = number
  default     = 10 // 10 represents 10 cache entries
  description = "(Optional) The number of cache entries. 0 means unlimited."
}

variable "transit_keys" {
  type = list(object({
    name                   = string
    type                   = string
    deletion_allowed       = bool
    derived                = bool
    convergent_encryption  = bool
    exportable             = bool
    allow_plaintext_backup = bool
    min_decryption_version = number
    min_encryption_version = number
  }))
  default     = []
  description = "(Optional) A list of transit key objects."
}
