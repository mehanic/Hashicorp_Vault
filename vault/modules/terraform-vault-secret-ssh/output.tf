output "ssh_backend_mount_path" {
  description = "The path at which the SSH backend is mounted"
  value       = vault_mount.ssh.path
}

output "ssh_host_key_sign_policy" {
  description = "The SSH host key sign policy"
  value       = vault_policy.host_key_sign.policy
}

output "ssh_host_key_sign_role" {
  description = "The name of the SSH host key sign role"
  value       = vault_ssh_secret_backend_role.host_key_sign.name
}

output "ssh_ca" {
  description = "The SSH Certificate Authority"
  value       = vault_ssh_secret_backend_ca.ca
  sensitive   = true
}

output "allowed_domains" {
  description = "List of allowed domains for SSH key signing"
  value       = var.allowed_domains
}

output "ssh_ttl" {
  description = "TTL for the SSH keys"
  value       = var.ttl
}

output "ssh_max_ttl" {
  description = "Maximum TTL for the SSH keys"
  value       = var.max_ttl
}

output "algorithm_signer" {
  description = "The algorithm used for SSH key signing"
  value       = var.algorithm
}
