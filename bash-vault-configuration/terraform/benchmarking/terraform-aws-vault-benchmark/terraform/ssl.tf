# ---------------------------
# Root Certificate (Self-Signed)
# ---------------------------
resource "tls_private_key" "root" {
  algorithm = "RSA"
}

resource "tls_self_signed_cert" "root" {
  key_algorithm   = "RSA"
  private_key_pem = tls_private_key.root.private_key_pem

  validity_period_hours = 26280  # Validity: 3 years
  early_renewal_hours   = 8760   # Early renewal: 1 year

  is_ca_certificate = true

  allowed_uses = [
    "cert_signing",
    "key_encipherment",
    "digital_signature",
    "server_auth",
    "client_auth",
  ]

  subject {
    common_name         = "HashiCorp. Root"
    organization        = "HashiCorp"
    organizational_unit = "HashiCorp SEs"
    street_address      = ["101 2nd St"]
    locality            = "San Francisco"
    province            = "CA"
    country             = "US"
    postal_code         = "94102"
  }
}

# ---------------------------
# Generic Certificate Module for Vault and Envoy
# ---------------------------
module "tls_certificate" {
  source = "./modules/tls_certificate"

  ca_key_algorithm   = tls_private_key.root.algorithm
  ca_private_key_pem = tls_private_key.root.private_key_pem
  ca_cert_pem        = tls_self_signed_cert.root.cert_pem
  validity_period_hours = 17520
  early_renewal_hours   = 8760
  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
    "client_auth",
  ]
}

# ---------------------------
# Vault Configuration
# ---------------------------
resource "tls_cert_request" "vault" {
  key_algorithm   = tls_private_key.vault.algorithm
  private_key_pem = tls_private_key.vault.private_key_pem

  subject {
    common_name         = "Vault"
    organization        = "HashiCorp"
    organizational_unit = "SE"
  }

  ip_addresses = var.vault_ip_addresses
  dns_names    = var.vault_dns_names
}

resource "tls_locally_signed_cert" "vault" {
  cert_request_pem = tls_cert_request.vault.cert_request_pem

  ca_key_algorithm   = tls_private_key.root.algorithm
  ca_private_key_pem = tls_private_key.root.private_key_pem
  ca_cert_pem        = tls_self_signed_cert.root.cert_pem

  validity_period_hours = 17520
  early_renewal_hours   = 8760

  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
    "client_auth",
  ]
}

# ---------------------------
# Envoy Configuration
# ---------------------------
resource "tls_cert_request" "envoy" {
  key_algorithm   = tls_private_key.envoy.algorithm
  private_key_pem = tls_private_key.envoy.private_key_pem

  subject {
    common_name         = "Envoy"
    organization        = "HashiCorp"
    organizational_unit = "SE"
  }

  ip_addresses = var.envoy_ip_addresses
  dns_names    = var.envoy_dns_names
}

resource "tls_locally_signed_cert" "envoy" {
  cert_request_pem = tls_cert_request.envoy.cert_request_pem

  ca_key_algorithm   = tls_private_key.root.algorithm
  ca_private_key_pem = tls_private_key.root.private_key_pem
  ca_cert_pem        = tls_self_signed_cert.root.cert_pem

  validity_period_hours = 17520
  early_renewal_hours   = 8760

  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
    "client_auth",
  ]
}

# ---------------------------
# Variables
# ---------------------------
variable "vault_ip_addresses" {
  description = "List of IP addresses for the Vault server."
  type        = list(string)
  default     = ["127.0.0.1", "10.0.1.15", "10.0.2.16", "10.0.3.17"]
}

variable "vault_dns_names" {
  description = "List of DNS names for the Vault server."
  type        = list(string)
  default     = [
    "active.vault.service.consul",
    "performance-standby.vault.service.consul",
    "standby.service.consul",
    "vault.service.consul"
  ]
}

variable "envoy_ip_addresses" {
  description = "List of IP addresses for the Envoy proxy."
  type        = list(string)
  default     = ["127.0.0.1", "10.0.1.20"]
}

variable "envoy_dns_names" {
  description = "List of DNS names for the Envoy proxy."
  type        = list(string)
  default     = ["envoy.service.consul"]
}

variable "validity_period_hours" {
  description = "The validity period of the certificates in hours."
  default     = 17520  # 2 years
}

variable "early_renewal_hours" {
  description = "The early renewal period for certificates in hours."
  default     = 8760   # 1 year
}

variable "allowed_uses" {
  description = "List of allowed uses for the certificate."
  default     = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
    "client_auth"
  ]
}

# ---------------------------
# Outputs for Certificates and Keys
# ---------------------------
output "vault_cert_pem" {
  description = "The PEM encoded Vault certificate."
  value       = tls_locally_signed_cert.vault.cert_pem
}

output "vault_private_key_pem" {
  description = "The PEM encoded Vault private key."
  value       = tls_private_key.vault.private_key_pem
}

output "envoy_cert_pem" {
  description = "The PEM encoded Envoy certificate."
  value       = tls_locally_signed_cert.envoy.cert_pem
}

output "envoy_private_key_pem" {
  description = "The PEM encoded Envoy private key."
  value       = tls_private_key.envoy.private_key_pem
}
