output "userpass_auth_backend" {
  description = "The path of the Userpass authentication backend."
  value       = vault_auth_backend.example.path
}

output "admin_policy_name" {
  description = "Name of the Vault policy for administrators."
  value       = vault_policy.admin_policy.name
}

output "developer_policy_name" {
  description = "Name of the Vault policy for developers."
  value       = vault_policy.developer_policy.name
}

output "operations_policy_name" {
  description = "Name of the Vault policy for operations."
  value       = vault_policy.operations_policy.name
}

output "developers_mount_path" {
  description = "Path of the KV2 secrets engine for developers."
  value       = vault_mount.developers.path
}

output "operations_mount_path" {
  description = "Path of the KV2 secrets engine for operations."
  value       = vault_mount.operations.path
}

output "developer_sample_data" {
  description = "Sample secret data stored at the developers KV engine path."
  value       = vault_generic_secret.developer_sample_data.path
}
