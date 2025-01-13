output "ssh_mount_path" {
  description = "The path where the SSH secret backend is mounted."
  value       = vault_mount.ssh.path
}

output "ssh_mount_description" {
  description = "Description of the SSH secrets engine mount."
  value       = vault_mount.ssh.description
}

output "ssh_ca_backend" {
  description = "Backend path used by the SSH Certificate Authority."
  value       = vault_ssh_secret_backend_ca.ssh.backend
}

output "ssh_ca_public_key" {
  description = "Public key of the SSH Certificate Authority."
  value       = vault_ssh_secret_backend_ca.ssh.public_key
}

output "ssh_role_name" {
  description = "Name of the SSH secret backend role."
  value       = vault_ssh_secret_backend_role.ssh.name
}

output "ssh_role_allowed_users" {
  description = "List of users allowed by the SSH role."
  value       = vault_ssh_secret_backend_role.ssh.allowed_users
}

output "ssh_role_default_user" {
  description = "Default user for the SSH role."
  value       = vault_ssh_secret_backend_role.ssh.default_user
}

output "ssh_role_allowed_domains" {
  description = "Domains allowed for the SSH role."
  value       = vault_ssh_secret_backend_role.ssh.allowed_domains
}

output "ssh_role_key_type" {
  description = "Key type used by the SSH role."
  value       = vault_ssh_secret_backend_role.ssh.key_type
}

output "ssh_role_max_ttl" {
  description = "Maximum TTL for the SSH role."
  value       = vault_ssh_secret_backend_role.ssh.max_ttl
}
