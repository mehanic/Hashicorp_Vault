output "ssh_secret_engine_mount_path" {
  description = "Path where the SSH secret engine is mounted"
  value       = vault_mount.ssh.path
}

output "ssh_ca_role_name" {
  description = "Name of the SSH CA role"
  value       = vault_ssh_secret_backend_role.ssh_ca_role.name
}

output "ssh_ca_role_ttl" {
  description = "TTL for the SSH CA role"
  value       = vault_ssh_secret_backend_role.ssh_ca_role.ttl
}

output "ssh_ca_generate_signing_key" {
  description = "Indicates if a signing key was generated for SSH CA"
  value       = vault_ssh_secret_backend_ca.ssh_ca.generate_signing_key
}

output "ssh_otp_role_name" {
  description = "Name of the SSH OTP role"
  value       = vault_ssh_secret_backend_role.ssh_otp_role.name
}

output "ssh_otp_default_user" {
  description = "Default user for the SSH OTP role"
  value       = vault_ssh_secret_backend_role.ssh_otp_role.default_user
}

output "ssh_otp_allowed_users" {
  description = "Allowed users for the SSH OTP role"
  value       = vault_ssh_secret_backend_role.ssh_otp_role.allowed_users
}

output "ssh_otp_cidr_list" {
  description = "CIDR list for the SSH OTP role"
  value       = vault_ssh_secret_backend_role.ssh_otp_role.cidr_list
}
