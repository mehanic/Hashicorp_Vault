output "secret1_path" {
  description = "Path for secret1"
  value       = vault_kv_secret_v2.secrets["secret1"].name
}

output "secret2_path" {
  description = "Path for secret2"
  value       = vault_kv_secret_v2.secrets["secret2"].name
}

output "secret3_path" {
  description = "Path for secret3"
  value       = vault_kv_secret_v2.secrets["secret3"].name
}
