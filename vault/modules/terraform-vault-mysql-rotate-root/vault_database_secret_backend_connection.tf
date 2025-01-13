resource "vault_database_secret_backend_connection" "this" {
  name              = var.database
  backend           = try(var.backend.path, var.backend)
  verify_connection = var.verify_connection
  allowed_roles     = var.allowed_roles
  mysql {
    connection_url = "{{username}}:{{password}}@tcp(${var.host}:${var.port})/"
    username       = "${mysql_user.this.user}${var.login_name_suffix}"
    tls_ca         = var.server_ca
  }
  data = {
    username = "${mysql_user.this.user}${var.login_name_suffix}"
    password = var.password
  }
}
