output "transit_mount_path" {
  description = "Path where the transit secret engine is mounted."
  value       = module.terraform-vault-transit.transit_mount_path
}

output "policy_name" {
  description = "The name of the created policy."
  value       = module.terraform-vault-transit.policy_name
}

output "transit_keys" {
  description = "Details of the created transit secret backend keys."
  value       = module.terraform-vault-transit.transit_keys
}
