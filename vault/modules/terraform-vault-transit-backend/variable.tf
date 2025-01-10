variable "type" {
  default = "transit"
}

variable "path" {
  default = "transit-backend"
}

variable "description" {
  default = null
}

variable "default_lease_ttl" {
  default = null
}

variable "max_lease_ttl" {
  default = null
}

variable "keys" {
  type    = set(string)
  default = []
}