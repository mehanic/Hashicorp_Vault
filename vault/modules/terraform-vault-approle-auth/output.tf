output "approle_role_name" {
  value = vault_approle_auth_backend_role.approle.role_name
}

output "approle_role_id" {
  value = vault_approle_auth_backend_role.approle.role_id
}

output "approle_mount_path" {
  value = vault_auth_backend.approle.path
}