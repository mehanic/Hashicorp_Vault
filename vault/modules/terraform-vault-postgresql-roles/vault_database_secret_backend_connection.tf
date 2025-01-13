resource "vault_database_secret_backend_connection" "postgresql" {
  backend       = var.backend
  name          = var.database_name
  allowed_roles = keys(var.postgresql_roles) # Extract role names

  postgresql {
    // connection_url = var.postgresql_connection_url

    // postgresql {
    connection_url          = "postgres://${var.db_username}:${var.db_password}@${var.db_host}:${var.db_port}/${var.db_name}?sslmode=${var.ssl_mode}"
    max_open_connections    = var.max_open_connections
    max_idle_connections    = var.max_idle_connections
    max_connection_lifetime = var.max_connection_lifetime
    //depends_on = [vault_mount.database]
  }
}
