resource "vault_database_secret_backend_connection" "this" {
  backend = vault_mount.database.path
  name    = var.database_name
  allowed_roles = [
    "readonly"
  ]
  data = {
    "username" = var.database_username
    "password" = var.database_password
  }

  postgresql {
    username          = var.database_username
    password          = var.database_password
    connection_url    = "postgresql://{{username}}:{{password}}@${var.database_server_address}:${var.database_server_port}/${var.database_name}?sslmode=${var.ssl_mode}"
    username_template = "${var.project_id}-{{.RoleName}}-{{unix_time}}-{{random 8}}"
  }
}
