resource "vault_database_secret_backend_connection" "default" {
  backend                  = vault_mount.default.path
  name                     = var.db_backend_connection_name
  allowed_roles            = ["dev"]
  root_rotation_statements = ["ALTER ROLE \"{{name}}\" WITH PASSWORD '{{password}}';"]
  postgresql {
    connection_url = "postgres://{{username}}:{{password}}@${var.db_hostname}:${var.db_tcp_port}/postgres"
    username       = var.db_username
    password       = var.db_password
  }
}
