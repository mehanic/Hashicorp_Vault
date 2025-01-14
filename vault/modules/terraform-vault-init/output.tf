#------------------------------------------------------------------------------
# Outputs for the module
#------------------------------------------------------------------------------
output "admin_username" {
  value = "admin"
}

output "admin_policy_name" {
  value = vault_policy.admin.name
}

output "devops_username" {
  value = "devops"
}

output "devops_policy_name" {
  value = vault_policy.devops.name
}

output "role_id_ro" {
  value     = vault_approle_auth_backend_role.cicd-ro.role_id
  sensitive = true
}

output "secret_id_ro" {
  value     = vault_approle_auth_backend_role_secret_id.cicd-ro.secret_id
  sensitive = true
}

output "role_id_rw" {
  value     = vault_approle_auth_backend_role.cicd-rw.role_id
  sensitive = true
}

output "secret_id_rw" {
  value     = vault_approle_auth_backend_role_secret_id.cicd-rw.secret_id
  sensitive = true
}


output "vault_admin_policy" {
  description = "The admin policy applied in Vault"
  value       = vault_policy.admin.name
}

output "vault_devops_policy" {
  description = "The devops policy applied in Vault"
  value       = vault_policy.devops.name
}

output "vault_cicd_ro_policy" {
  description = "The CICD read-only policy applied in Vault"
  value       = vault_policy.cicd-ro.name
}

output "vault_cicd_rw_policy" {
  description = "The CICD read-write policy applied in Vault"
  value       = vault_policy.cicd-rw.name
}

output "vault_userpass_auth_backend" {
  description = "The Userpass authentication backend path"
  value       = vault_auth_backend.userpass.path
}

output "admin_user_token_ttl" {
  description = "Token TTL for the admin user"
  value       = vault_generic_endpoint.admin_user.data_json
  sensitive   = true
}

output "devops_user_token_ttl" {
  description = "Token TTL for the devops user"
  value       = vault_generic_endpoint.devops_user.data_json
  sensitive   = true
}

output "vault_approle_auth_backend_path" {
  description = "The AppRole authentication backend path"
  value       = vault_auth_backend.approle.path
}

output "vault_cicd_ro_secret_id" {
  description = "Secret ID for CICD read-only AppRole"
  sensitive   = true
  value       = vault_approle_auth_backend_role_secret_id.cicd-ro.id
}

output "vault_cicd_rw_secret_id" {
  description = "Secret ID for CICD read-write AppRole"
  sensitive   = true
  value       = vault_approle_auth_backend_role_secret_id.cicd-rw.id
}

output "vault_kv_mount_path" {
  description = "The path of the kv-v2 secrets engine"
  value       = vault_mount.laboratory.path
  sensitive   = true
}

output "vault_ssh_secret" {
  description = "Stored SSH keys in Vault"
  value       = vault_kv_secret_v2.ssh[0].data_json
  sensitive   = true
}

output "vault_pve_auth_user_password_secret" {
  description = "Stored Proxmox user/password authentication secrets"
  value       = vault_kv_secret_v2.pve_auth_user_password[0].data_json
  sensitive   = true
}

output "vault_pve_auth_api_secret" {
  description = "Stored Proxmox API authentication secrets"
  value       = vault_kv_secret_v2.pve_auth_user_api_token[0].data_json
  sensitive   = true
}
