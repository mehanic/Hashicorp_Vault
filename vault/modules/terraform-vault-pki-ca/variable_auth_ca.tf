variable "conf_auth_ca_path" {
  type = string
  default = "config_auth_ca"
}

variable "conf_auth_ca_description" {
  type = string
  default = "Config auth intermediate CA"
}

variable "conf_auth_ca_default_lease_ttl_seconds" {
  type = number
  default = 86400
}

variable "conf_auth_ca_max_ttl_seconds" {
  type = number
  default = 86400
}

variable "conf_auth_ca_backend_role_name" {
  type = string
  default = "int_ca_role"
}

variable "conf_auth_ca_max_ttl" {
  type = string
  default = "365d"
}

variable "conf_auth_ca_ttl" {
  type = string
  default = "365d"
}

variable "conf_auth_ca_cert_common_name" {
  type = string
  default = "config_auth_ca"
}

variable "conf_auth_ca_cert_ou" {
  type = string
  default = "Platform"
}

variable "conf_auth_ca_cert_organization" {
  type = string
  default = "Corp"
}

variable "conf_auth_ca_cert_country" {
  type = string
  default = "US"
}

variable "conf_auth_ca_cert_locality" {
  type = string
  default = "San Francisco"
}