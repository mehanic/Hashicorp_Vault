output "kv_mount_path" {
  description = "The path where the KV secret engine is mounted"
  value       = module.terraform-vault-kv-path.kv_mount_path
}

output "kv_mount_type" {
  description = "The type of the KV secret engine"
  value       = module.terraform-vault-kv-path.kv_mount_type
}

output "kv_mount_description" {
  description = "The description of the KV secret engine"
  value       = module.terraform-vault-kv-path.kv_mount_description
}

output "secret_path" {
  description = "The path where the secret is stored"
  value       = module.terraform-vault-kv-path.secret_path
}

output "secret_data" {
  description = "The secret data stored in the KV engine"
  sensitive   = true
  value       = module.terraform-vault-kv-path.secret_data
}
