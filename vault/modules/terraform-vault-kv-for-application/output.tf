#vault_mount_paths: Lists all the paths created for each environment.
output "vault_mount_paths" {
  description = "The mount paths for each environment"
  value       = [for i in vault_mount.application-root-per-env : i.path]
}

#vault_secret_provider_policies: Outputs the names of secret-provider policies.
output "vault_secret_provider_policies" {
  description = "The secret-provider policies created per environment"
  value       = [for i in vault_policy.secretprovider : i.name]
}


#vault_secret_consumer_policies: Outputs the names of secret-consumer policies.
output "vault_secret_consumer_policies" {
  description = "The secret-consumer policies created per environment"
  value       = [for i in vault_policy.secretconsumer : i.name]
}

#vault_secret_admin_policies: Outputs the names of secret-admin policies.
output "vault_secret_admin_policies" {
  description = "The secret-admin policies created per environment"
  value       = [for i in vault_policy.secretadmin : i.name]
}

#vault_approle_roles_provider: Lists the AppRole names for secret-provider.
output "vault_approle_roles_provider" {
  description = "The approle roles for secret-provider per environment"
  value       = [for i in vault_approle_auth_backend_role.secret-provider-approle : i.role_name]
}

#vault_approle_roles_consumer: Lists the AppRole names for secret-consumer.
output "vault_approle_roles_consumer" {
  description = "The approle roles for secret-consumer per environment"
  value       = [for i in vault_approle_auth_backend_role.secret-consumer-approle : i.role_name]
}
#vault_approle_roles_admin: Lists the AppRole names for secret-admin.
output "vault_approle_roles_admin" {
  description = "The approle roles for secret-admin per environment"
  value       = [for i in vault_approle_auth_backend_role.secret-admin-approle : i.role_name]
}