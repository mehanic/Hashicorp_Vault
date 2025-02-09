output "cert_common_name" {
  description = "The common name for the certificate."
  value       = module.terraform-vault-pki-request-certificate-from-existing.cert_common_name
}

output "cert_serial_number" {
  description = "The serial number of the certificate."
  value       = module.terraform-vault-pki-request-certificate-from-existing.cert_serial_number
}

output "cert_certificate" {
  description = "The certificate issued."
  value       = module.terraform-vault-pki-request-certificate-from-existing.cert_certificate
}

output "cert_private_key" {
  description = "The private key for the certificate."
  value       = module.terraform-vault-pki-request-certificate-from-existing.cert_private_key
  sensitive   = true
}

output "kv_secret_path" {
  description = "The path where the certificate is stored in KV."
  value       = module.terraform-vault-pki-request-certificate-from-existing.kv_secret_path
}

output "kv_secret_data" {
  description = "The data stored in the KV for the certificate."
  value       = module.terraform-vault-pki-request-certificate-from-existing.kv_secret_data
  sensitive   = true
}

//vault secrets enable -path=pki_root_ca pki
//vault write pki_root_ca/root/generate/internal common_name="Root CA" ttl=87600h
//vault write pki_root_ca/config/issuers/default issuer_ref="<issuer-ref>"
//vault list pki_root_ca/issuers
//vault secrets enable -path=kvv2 kv-v2
