variable "web_issuer_ca_path" {
  type = string
  default = "web_issuer_ca"
}

variable "web_issuer_ca_description" {
  type = string
  default = "ACME intermediate CA"
}

variable "web_issuer_ca_backend_role_name" {
  type = string
  default = "web_issuer_ca_role"
}

variable "web_issuer_ca_ttl" {
  type = string
  default = "720h"
}

variable "web_issuer_ca_max_ttl" {
  type = string
  default = "8760h"
}

variable "web_issuer_ca_cert_common_name" {
  type = string
 default = "web_issuer_ca"
}
