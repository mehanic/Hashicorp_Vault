output "vault_mount_path" {
  value = vault_mount.postgres.path
}

output "vault_role" {
  value = vault_database_secret_backend_role.postgres.name
}

output "vault_policy" {
  value = vault_policy.postgres.name
}