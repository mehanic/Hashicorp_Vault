output "ssh_mount_path" {
  description = "The path where the SSH secret backend is mounted."
  value       = module.terraform-vault-ssh-backend-ca.ssh_mount_path
}

output "ssh_mount_description" {
  description = "Description of the SSH secrets engine mount."
  value       = module.terraform-vault-ssh-backend-ca.ssh_mount_description
}

output "ssh_ca_backend" {
  description = "Backend path used by the SSH Certificate Authority."
  value       = module.terraform-vault-ssh-backend-ca.ssh_ca_backend
}

output "ssh_ca_public_key" {
  description = "Public key of the SSH Certificate Authority."
  value       = module.terraform-vault-ssh-backend-ca.ssh_ca_public_key
}

output "ssh_role_name" {
  description = "Name of the SSH secret backend role."
  value       = module.terraform-vault-ssh-backend-ca.ssh_role_name
}

output "ssh_role_allowed_users" {
  description = "List of users allowed by the SSH role."
  value       = module.terraform-vault-ssh-backend-ca.ssh_role_allowed_users
}

output "ssh_role_default_user" {
  description = "Default user for the SSH role."
  value       = module.terraform-vault-ssh-backend-ca.ssh_role_default_user
}

output "ssh_role_allowed_domains" {
  description = "Domains allowed for the SSH role."
  value       = module.terraform-vault-ssh-backend-ca.ssh_role_allowed_domains
}

output "ssh_role_key_type" {
  description = "Key type used by the SSH role."
  value       = module.terraform-vault-ssh-backend-ca.ssh_role_key_type
}

output "ssh_role_max_ttl" {
  description = "Maximum TTL for the SSH role."
  value       = module.terraform-vault-ssh-backend-ca.ssh_role_max_ttl
}
