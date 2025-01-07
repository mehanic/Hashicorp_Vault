# output "userpass-data" {
#   sensitive = true
#   value = module.terraform-vault-userpass.userpass-data

# }
output "auth_backend_path" {
  description = "The path at which the userpass authentication method is mounted."
  value       = module.terraform-vault-userpass.auth_backend_path
}

output "user_created" {
  description = "The details of the user created in the userpass authentication method."
  value       = module.terraform-vault-userpass.user_created
}


output "max_lease_ttl" {
  description = "The max lease TTL set for the userpass authentication method."
  value       = module.terraform-vault-userpass.max_lease_ttl
}