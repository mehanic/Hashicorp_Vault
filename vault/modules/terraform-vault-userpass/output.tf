output "userpass-data" {
  sensitive = true
  value = {
    "mount-data" = vault_auth_backend.userpass
    "user-data"  = vault_generic_endpoint.user
  }

}
output "auth_backend_path" {
  description = "The path at which the userpass authentication method is mounted."
  value       = vault_auth_backend.userpass.path
}

output "user_created" {
  description = "The details of the user created in the userpass authentication method."
  value = {
    user_name = var.user
    policies  = ["mypolicy"]
  }
}

# output "user_password" {
#   description = "The password associated with the created user."
#   value = "changeme"
#   sensitive = true
# }

output "max_lease_ttl" {
  description = "The max lease TTL set for the userpass authentication method."
  value       = tolist(vault_auth_backend.userpass.tune)[0].max_lease_ttl
}