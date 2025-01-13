resource "vault_database_secret_backend_connection" "this" {
  plugin_name = "postgresql-database-plugin"
  backend     = var.vault_mount_postgres_path
  name        = var.database_connection_name
  allowed_roles = [
    for role in var.database_roles : role.name
  ]
  #verify_connection = true

  data = {
    "username" = var.database_username
    "password" = var.database_password
  }

  postgresql {
    connection_url = "postgresql://{{username}}:{{password}}@${local.database_address}/${var.database_name}?sslmode=${var.database_sslmode}"
    username       = var.database_username
    password       = var.database_password
  }
}