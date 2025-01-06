output "userpass_auth_backend" {
  description = "The path of the Userpass authentication backend."
  value       = module.terraform-vault-policy-divide.userpass_auth_backend
}

output "admin_policy_name" {
  description = "Name of the Vault policy for administrators."
  value       = module.terraform-vault-policy-divide.admin_policy_name
}

output "developer_policy_name" {
  description = "Name of the Vault policy for developers."
  value       = module.terraform-vault-policy-divide.developer_policy_name
}

output "operations_policy_name" {
  description = "Name of the Vault policy for operations."
  value       = module.terraform-vault-policy-divide.operations_policy_name
}

output "developers_mount_path" {
  description = "Path of the KV2 secrets engine for developers."
  value       = module.terraform-vault-policy-divide.developers_mount_path
}

output "operations_mount_path" {
  description = "Path of the KV2 secrets engine for operations."
  value       = module.terraform-vault-policy-divide.operations_mount_path
}

output "developer_sample_data" {
  description = "Sample secret data stored at the developers KV engine path."
  value       = module.terraform-vault-policy-divide.developer_sample_data
}
