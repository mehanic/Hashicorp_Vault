# variable "module_depends_on" {
#   type    = any
#   default = []
# }

# variable "cert" {
#   description = "The certificate to use for the cert auth backend."
#   type        = string
# }

# variable "cert_auth_role_name" {
#   description = "The name of the cert auth backend role."
#   type        = string
#   default     = "cert-role"
# }


variable "config_paths" {
  description = "List of paths to the configuration secrets in Vault."
  type        = list(string)
  default  =  [
    "secret/data/my-config",
    "secret/data/another-config",
    "secret/data/my-app/secrets"
  ]
}


variable "cert_auth_mount_path" {
  description = "The mount path of the cert auth backend."
  type        = string
  default     = "cert"
}


variable "config_policy_name" {
  description = "The name of the policy to access the configuration secrets."
  type        = string
  default     = "config-access-policy"
} 


variable "cert_auth_role_name" {
  description = "Name of the cert auth backend role"
  type        = string
  default     = "foo"
}

variable "cert_file_path" {
  description = "Path to the certificate file"
  type        = string
  default     = "../../modules/terraform-vault-cert-auth/cert/cert.pem"
}

variable "allowed_common_names" {
  description = "Common names allowed for client certificates"
  type        = list(string)
  default     = ["foo.example.org", "baz.example.org"]
}

variable "allowed_dns_sans" {
  description = "DNS SANs allowed for client certificates"
  type        = list(string)
  default     = []
}

variable "token_ttl" {
  description = "TTL for tokens issued by the role"
  type        = number
  default     = 300
}

variable "token_max_ttl" {
  description = "Maximum TTL for tokens issued by the role"
  type        = number
  default     = 600
}

variable "token_policies" {
  description = "Policies associated with tokens issued by the role"
  type        = list(string)
  default     = ["foo"]
}

variable "ocsp_enabled" {
  description = "Enable OCSP validation for client certificates"
  type        = bool
  default     = false
}

variable "ocsp_fail_open" {
  description = "Allow authentication to proceed if OCSP response is unavailable"
  type        = bool
  default     = false
}

variable "token_type" {
  description = "Type of token to issue (service, batch, default)"
  type        = string
  default     = "service"
}

variable "token_bound_cidrs" {
  description = "CIDRs that can authenticate and be bound to the token"
  type        = list(string)
  default     = []
}

variable "token_num_uses" {
  description = "Maximum number of times a token may be used"
  type        = number
  default     = 0
}
