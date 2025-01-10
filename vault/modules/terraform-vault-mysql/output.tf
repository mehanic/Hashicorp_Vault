output "namespace" {
  value       = var.vault_namespace
  description = "Vault namespace"
}

output "backend" {
  value       = var.vault_mount_path
  description = "Vault Dynamic Secret Engine Path"
}

output "roles" {
  value       = local.db_roles
  description = "Dynamic Secret Engine Roles"
}

output "allowed_roles" {
  value       = local.allowed_roles
  description = "Allowed Dynamic Secret Engine Roles"
}
