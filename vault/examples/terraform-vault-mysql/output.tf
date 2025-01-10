output "namespace" {
  value       = module.terraform-vault-mysql.namespace
  description = "Vault namespace"
}

output "backend" {
  value       = module.terraform-vault-mysql.backend
  description = "Vault Dynamic Secret Engine Path"
}

output "roles" {
  value       = module.terraform-vault-mysql.roles
  description = "Dynamic Secret Engine Roles"
}

output "allowed_roles" {
  value       = module.terraform-vault-mysql.allowed_roles
  description = "Allowed Dynamic Secret Engine Roles"
}
