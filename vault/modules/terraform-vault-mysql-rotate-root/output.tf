# Output the MySQL user name
output "mysql_user_name" {
  description = "The name of the MySQL user"
  value       = mysql_user.this.user
}

# Output the MySQL user host
output "mysql_user_host" {
  description = "The host of the MySQL user"
  value       = mysql_user.this.host
}

# Output the MySQL user password (sensitive)
output "mysql_user_password" {
  description = "The password of the MySQL user"
  value       = mysql_user.this.plaintext_password
  sensitive   = true
}

# Output the MySQL grant details for each database
output "mysql_grant_privileges" {
  description = "The granted privileges for the MySQL user"
  value       = { for db, grants in mysql_grant.this : db => grants.privileges }
}

# Output the Vault database connection URL
output "vault_database_connection_url" {
  description = "The connection URL for the Vault database backend"
  value       = vault_database_secret_backend_connection.this.mysql[0].connection_url
}

# Output the Vault database username
output "vault_database_username" {
  description = "The username for the Vault database backend"
  value       = vault_database_secret_backend_connection.this.data["username"]
}

# Output the Vault database password (sensitive)
output "vault_database_password" {
  description = "The password for the Vault database backend"
  value       = vault_database_secret_backend_connection.this.data["password"]
  sensitive   = true
}

# Output the Vault rotation path for root credentials
output "vault_rotation_path" {
  description = "The path to rotate root credentials in Vault"
  value       = vault_generic_endpoint.rotate_root.path
}
