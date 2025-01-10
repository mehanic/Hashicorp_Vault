
output "transit_mount_path" {
  description = "Path where the transit backend is mounted."
  value       = module.terraform-vault-transit-cache.transit_mount_path
}

output "transit_cache_size" {
  description = "Cache size configured for the transit backend."
  value       = module.terraform-vault-transit-cache.transit_cache_size
}

output "transit_keys" {
  description = "Details of all transit keys created."
  value       = module.terraform-vault-transit-cache.transit_keys
}