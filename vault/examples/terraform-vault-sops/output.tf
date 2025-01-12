# output "approle_id" {
#   description = "Approle ID"
#   value       = module.terraform-vault-sops.approle_id
# }

# output "approle_secret" {
#   description = "Approle Secret ID"
#   value       = module.terraform-vault-sops.approle_secret
#   sensitive   = true
# }

# output "backend_path" {
#   description = "The Auth Backend path mounted upon"
#   value       = module.terraform-vault-sops.backend_path
# }