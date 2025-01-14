variable "pki_path" {
  description = "The Vault PKI Secrets Path. Should not end with a slash, but may contain them. Default is \"pki\""
  type        = string
  default     = "ops/pki"
}
variable "pki_map" {
  type = map(object({
    common_name               = string
    description               = string
    default_lease_ttl_seconds = number
    max_lease_ttl_seconds     = number
    issuing_certificates      = list(string)
    intermediates = map(object({
      common_name               = string
      description               = string
      default_lease_ttl_seconds = number
      max_lease_ttl_seconds     = number
      issuing_certificates      = list(string)
      exclude_cn_from_sans      = bool
      ttl                       = number
      organization              = string
      ou                        = string
      country                   = string
      locality                  = string
      province                  = string
      roles = map(object({
        ttl                = number
        max_ttl            = number
        allow_localhost    = bool
        allowed_domains    = list(string)
        allow_bare_domains = bool
        allow_subdomains   = bool
        allow_glob_domains = bool
        allow_ip_sans      = bool
      }))
    }))
  }))

  default = {
    "ops-pki" = {
      common_name               = "Operations Root CA"
      description               = "Root Certificate Authority for Operations"
      default_lease_ttl_seconds = 31536000
      max_lease_ttl_seconds     = 63072000
      issuing_certificates      = ["http://example.com/ca.crt"]
      intermediates = {
        "ops-intermediate" = {
          common_name               = "Operations Intermediate CA"
          description               = "Intermediate CA for Operations"
          default_lease_ttl_seconds = 15768000
          max_lease_ttl_seconds     = 31536000
          issuing_certificates      = ["http://example.com/intermediate.crt"]
          exclude_cn_from_sans      = false
          ttl                       = 2592000
          organization              = "Example Corp"
          ou                        = "Operations"
          country                   = "US"
          locality                  = "San Francisco"
          province                  = "California"
          roles = {
            "server-cert" = {
              ttl                = 86400
              max_ttl            = 2592000
              allow_localhost    = true
              allowed_domains    = ["example.com", "internal.example.com"]
              allow_bare_domains = false
              allow_subdomains   = true
              allow_glob_domains = false
              allow_ip_sans      = true
            }
          }
        }
      }
    }
  }
}
