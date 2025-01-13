variable "module_depends_on" {
  type    = any
  default = []
}

variable "root_ca_path" {
  type = string
  default = "root_ca"
}

variable "root_ca_description" {
  type = string
  default = "Root CA"
}

variable "root_ca_role_name" {
  type = string
  default = "root_ca_role"
}

variable "root_ca_max_ttl" {
  type = string
  default = "8760h"
}

variable "root_ca_default_lease_ttl_seconds" {
  type = number
  default = 94608000
}

variable "root_ca_max_ttl_seconds" {
  type = number
  default = 94608000
}

variable "root_cert_common_name" {
  type = string
  default = "root_ca"
}

variable "root_cert_ttl" {
  type = string
  default = "315360000"
}

variable "root_ca_ou" {
  type = string
  default = "Platform"
}

variable "root_ca_organization" {
  type = string
  default = "Corp"
}

variable "vault_allowed_domains" {
  type = list(string)
  default = [ "corp.local" ]
}

variable "vault_address" {
  type = string
  default = "https://vault.corp.local:8200"
}