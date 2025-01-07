variable "kv_path" {
  type    = string
  default = "secret"
}

variable "transit_path" {
  type    = string
  default = "occult"
}

variable "transit_keys" {
  type = list(object({
    name             = string
    type             = optional(string)
    deletion_allowed = optional(bool)
  }))
  default = []
}
