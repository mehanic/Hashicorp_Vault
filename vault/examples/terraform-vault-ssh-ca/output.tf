output "ssh_mount_path" {
  description = "The path for the SSH secret backend mount"
  value       = module.terraform-vault-ssh-ca.ssh_mount_path
}

output "ssh_ca_public_key" {
  description = "The public key for the SSH Certificate Authority"
  value       = module.terraform-vault-ssh-ca.ssh_ca_public_key
}

output "kitchen_ssh_role_name" {
  description = "The name of the SSH secret backend role for kitchen"
  value       = module.terraform-vault-ssh-ca.kitchen_ssh_role_name
}

output "userpass_backend_accessor" {
  description = "The accessor for the userpass authentication backend"
  value       = module.terraform-vault-ssh-ca.userpass_backend_accessor
}

output "kitchen_entity_id" {
  description = "The entity ID for the kitchen identity"
  value       = module.terraform-vault-ssh-ca.kitchen_entity_id
}

output "kitchen_identity_group_id" {
  description = "The group ID for the kitchen identity group"
  value       = module.terraform-vault-ssh-ca.kitchen_identity_group_id
}
