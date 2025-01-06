output "app_role_mount_point" {
  value = module.terraform-vault-approle.app_role_mount_point
}

output "role_name" {
  value = module.terraform-vault-approle.role_name
}

output "role_id" {
  value = module.terraform-vault-approle.role_id
}

output "secret_id" {
  value     = module.terraform-vault-approle.secret_id
  sensitive = true
}