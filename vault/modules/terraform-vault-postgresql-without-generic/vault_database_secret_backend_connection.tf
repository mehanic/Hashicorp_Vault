resource "vault_database_secret_backend_connection" "postgres" {
  backend       = vault_mount.postgres.path
  name          = var.name
  allowed_roles = var.allowed_roles

  postgresql {
    connection_url = "postgresql://{{username}}:{{password}}@${local.database_address}:${local.database_port}/${var.postgres_database_name}?${var.additional_connection_string_arguments}"
    username       = var.postgres_username
    password       = var.postgres_password
  }
}