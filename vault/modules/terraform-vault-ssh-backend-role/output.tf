
output "ssh_mount_path" {
  description = "The path of the SSH secrets engine mount"
  value       = vault_mount.ssh.path
}

output "client_keys_role_name" {
  description = "The name of the SSH secret backend role"
  value       = vault_ssh_secret_backend_role.client_keys.name
}

output "user_signing_policy_name" {
  description = "The name of the user signing policy"
  value       = vault_policy.user_signing.name
}

output "user_signing_policy" {
  description = "The full policy string for the user signing"
  value       = vault_policy.user_signing.policy
}