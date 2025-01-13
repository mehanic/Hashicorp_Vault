output "approle_role_name" {
  value = module.terraform-vault-approle-auth.approle_role_name
}

output "approle_role_id" {
  value = module.terraform-vault-approle-auth.approle_role_id
}

output "approle_mount_path" {
  value = module.terraform-vault-approle-auth.approle_mount_path
}