output "ssh_backend_mount_path" {
  description = "The path at which the SSH backend is mounted"
  value       = module.terraform-vault-secret-ssh.ssh_backend_mount_path
}

output "ssh_host_key_sign_policy" {
  description = "The SSH host key sign policy"
  value       = module.terraform-vault-secret-ssh.ssh_host_key_sign_policy
}

output "ssh_host_key_sign_role" {
  description = "The name of the SSH host key sign role"
  value       = module.terraform-vault-secret-ssh.ssh_host_key_sign_role
}

output "ssh_ca" {
  description = "The SSH Certificate Authority"
  value       = module.terraform-vault-secret-ssh.ssh_ca
  sensitive   = true
}

output "allowed_domains" {
  description = "List of allowed domains for SSH key signing"
  value       = module.terraform-vault-secret-ssh.allowed_domains
}

output "ssh_ttl" {
  description = "TTL for the SSH keys"
  value       = module.terraform-vault-secret-ssh.ssh_ttl
}

output "ssh_max_ttl" {
  description = "Maximum TTL for the SSH keys"
  value       = module.terraform-vault-secret-ssh.ssh_max_ttl
}

output "algorithm_signer" {
  description = "The algorithm used for SSH key signing"
  value       = module.terraform-vault-secret-ssh.algorithm_signer
}
