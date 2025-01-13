variable "pki_namespace" {
  description = "Vault Namespace"
  default     = "root"
}

variable "backend" {
  description = "backend"
  default     = "/pki1"
}

variable "name" {
  description = "certificate name"
  default     = "code_sign"
}

variable "common_name" {
  description = "common name"
  default     = "test.example.com"
}

variable "ttl" {
  description = "ttl"
  default     = "90d"
}

variable "format" {
  description = "format"
  default     = "pem"
}

variable "private_key_format" {
  description = "format"
  default     = "der"
}

variable "kv_path" {
  description = "kv_path"
  default     = "kvv2"
}

variable "kv_secret" {
  description = "kv_secret"
  default     = "secret"
}

