output "ssh_mount_path" {
  description = "The path for the SSH secret backend mount"
  value       = vault_mount.ssh.path
}

output "ssh_ca_public_key" {
  description = "The public key for the SSH Certificate Authority"
  value       = vault_ssh_secret_backend_ca.sshca.public_key
}

output "kitchen_ssh_role_name" {
  description = "The name of the SSH secret backend role for kitchen"
  value       = vault_ssh_secret_backend_role.kitchen.name
}

output "userpass_backend_accessor" {
  description = "The accessor for the userpass authentication backend"
  value       = vault_auth_backend.userpass.accessor
}

output "kitchen_entity_id" {
  description = "The entity ID for the kitchen identity"
  value       = vault_identity_entity.kitchen.id
}

output "kitchen_identity_group_id" {
  description = "The group ID for the kitchen identity group"
  value       = vault_identity_group.users.id
}
