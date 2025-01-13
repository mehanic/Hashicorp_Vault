output "cert_common_name" {
  description = "The common name for the certificate."
  value       = vault_pki_secret_backend_cert.cert.common_name
}

output "cert_serial_number" {
  description = "The serial number of the certificate."
  value       = vault_pki_secret_backend_cert.cert.serial_number
}

output "cert_certificate" {
  description = "The certificate issued."
  value       = vault_pki_secret_backend_cert.cert.certificate
}

output "cert_private_key" {
  description = "The private key for the certificate."
  value       = vault_pki_secret_backend_cert.cert.private_key
  sensitive   = true
}

output "kv_secret_path" {
  description = "The path where the certificate is stored in KV."
  value       = "${vault_kv_secret_v2.cert.mount}/data/${vault_kv_secret_v2.cert.name}"
}

output "kv_secret_data" {
  description = "The data stored in the KV for the certificate."
  value       = vault_kv_secret_v2.cert.data_json
  sensitive   = true
}
