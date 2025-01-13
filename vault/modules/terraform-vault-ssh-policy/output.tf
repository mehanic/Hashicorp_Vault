
output "ssh_backend_mount_path" {
  value = vault_mount.ssh.path
}

output "ssh_public_key" {
  value = vault_ssh_secret_backend_ca.ssh_backend.public_key
}

output "ssh_backend_role_name" {
  value = vault_ssh_secret_backend_role.ssh_backend_role.name   
}
