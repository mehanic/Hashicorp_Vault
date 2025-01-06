output "kv_mount_path" {
  description = "The path where the KV secret engine is mounted"
  value       = vault_mount.kv.path
}

output "kv_mount_type" {
  description = "The type of the KV secret engine"
  value       = vault_mount.kv.type
}

output "kv_mount_description" {
  description = "The description of the KV secret engine"
  value       = vault_mount.kv.description
}

output "secret_path" {
  description = "The path where the secret is stored"
  value       = vault_generic_secret.secret.path
}

output "secret_data" {
  description = "The secret data stored in the KV engine"
  sensitive   = true
  value       = vault_generic_secret.secret.data_json
}
