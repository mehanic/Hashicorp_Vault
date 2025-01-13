
output "ssh_backend_mount_path" {
  value = module.terraform-vault-ssh-policy.ssh_backend_mount_path
}

output "ssh_public_key" {
  value = module.terraform-vault-ssh-policy.ssh_public_key
}

output "ssh_backend_role_name" {
  value = module.terraform-vault-ssh-policy.ssh_backend_role_name
}
