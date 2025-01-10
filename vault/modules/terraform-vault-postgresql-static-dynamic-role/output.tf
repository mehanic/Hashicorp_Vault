output "vault_mount_path" {
  description = "Path of the Vault database secrets engine mount."
  value       = vault_mount.db.path
}

output "vault_database_secret_backend_connection" {
  description = "Details of the Vault database secret backend connection."
  value = {
    name          = vault_database_secret_backend_connection.postgres.name
    backend       = vault_database_secret_backend_connection.postgres.backend
    plugin_name   = vault_database_secret_backend_connection.postgres.plugin_name
    allowed_roles = vault_database_secret_backend_connection.postgres.allowed_roles
  }
}

output "vault_database_secret_backend_role_dynamic" {
  description = "Details of the Vault database secret backend dynamic credentials role."
  value = {
    name                = vault_database_secret_backend_role.postgres_dynamic_creds.name
    backend             = vault_database_secret_backend_role.postgres_dynamic_creds.backend
    db_name             = vault_database_secret_backend_role.postgres_dynamic_creds.db_name
    creation_statements = vault_database_secret_backend_role.postgres_dynamic_creds.creation_statements
    default_ttl         = vault_database_secret_backend_role.postgres_dynamic_creds.default_ttl
  }
}

output "vault_database_secret_backend_static_role" {
  description = "Details of the Vault database secret backend static role."
  value = {
    name                = vault_database_secret_backend_static_role.postgres_static_role.name
    backend             = vault_database_secret_backend_static_role.postgres_static_role.backend
    db_name             = vault_database_secret_backend_static_role.postgres_static_role.db_name
    username            = vault_database_secret_backend_static_role.postgres_static_role.username
    rotation_period     = vault_database_secret_backend_static_role.postgres_static_role.rotation_period
    rotation_statements = vault_database_secret_backend_static_role.postgres_static_role.rotation_statements
  }
}
