resource "vault_database_secret_backend_connection" "devbox_mysql" {
  backend       = vault_mount.database.path
  name          = "devbox_mysql"
  allowed_roles = var.allowed_roles

  mysql {
    connection_url = "{{username}}:{{password}}@tcp(${var.mysql_host}:3306)/"
    username       = var.mysql_username
    password       = var.mysql_password
  }
}
