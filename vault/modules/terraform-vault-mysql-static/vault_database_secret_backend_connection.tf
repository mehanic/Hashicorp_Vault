resource "vault_database_secret_backend_connection" "mysql" {
  backend       = vault_mount.mysql.path
  plugin_name   = "mysql-database-plugin"
  name          = "mysql"
  allowed_roles = var.allowed_roles

  mysql {
    connection_url    = "{{username}}:{{password}}@tcp(${var.mysql_host}:3306)/"
    username          = var.mysql_username
    password          = var.mysql_password
    username_template = "vault-mysql-{{random 3}}"
  }
}
