output "mongodb_connection_name" {
  description = "The name of the MongoDB connection."
  value       = vault_database_secret_backend_connection.mongodb.name
}

output "mongodb_connection_allowed_roles" {
  description = "The allowed roles for the MongoDB connection."
  value       = vault_database_secret_backend_connection.mongodb.allowed_roles
}

output "mongodb_role_name" {
  description = "The name of the MongoDB role."
  value       = vault_database_secret_backend_role.role.name
}

output "mongodb_role_creation_statements" {
  description = "The creation statements for the MongoDB role."
  value       = vault_database_secret_backend_role.role.creation_statements
}

output "mongodb_user_policy_name" {
  description = "The name of the MongoDB user policy."
  value       = vault_policy.mongodb_user.name
}

output "mongodb_user_policy_document" {
  description = "The policy document associated with the MongoDB user."
  value       = data.vault_policy_document.mongodb_user_policy.hcl
}
