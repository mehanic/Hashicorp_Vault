# Provider Configuration
provider "mysql" {
  endpoint = "tcp(${var.host}:${var.port})"
  username = var.username # Use the username from the variable or hardcode
  password = var.password # Use the password from the variable or hardcode
  //tls_ca   = var.server_ca
}

# MySQL User and Grant Resources
resource "mysql_user" "this" {
  provider           = mysql
  user               = var.name
  host               = var.host
  plaintext_password = var.password
}

resource "mysql_grant" "this" {
  provider   = mysql
  for_each   = var.grants
  host       = var.host
  user       = mysql_user.this.user
  database   = each.key
  privileges = each.value
  grant      = true
}

# Vault Database Secret Backend Connection
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

# Vault Endpoint for Rotation
resource "vault_generic_endpoint" "rotate_root" {
  path                 = "${vault_database_secret_backend_connection.this.backend}/rotate-root/${vault_database_secret_backend_connection.this.name}"
  ignore_absent_fields = true
  disable_read         = true
  disable_delete       = true
  data_json            = "{}"
  depends_on = [
    vault_database_secret_backend_connection.this
  ]
}
