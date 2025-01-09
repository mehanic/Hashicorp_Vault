# Output the path of the database secrets engine
output "vault_database_mount_path" {
  description = "The path of the Vault database backend used for the MongoDB connection."
  value       = var.path
}

# Output the allowed roles
output "allowed_roles" {
  description = "The allowed roles for the MongoDB database connection."
  value       = vault_database_secret_backend_connection.mongodb.allowed_roles
}

# Output the list of roles created in Vault for MongoDB
output "mongodb_roles" {
  description = "The roles created for MongoDB in Vault."
  value       = [for role in vault_database_secret_backend_role.mongodb : role.name]
}

# Output the database name
output "database_name" {
  description = "The logical name of the MongoDB database."
  value       = var.database_name
}
