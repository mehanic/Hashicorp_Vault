# resource "vault_mount" "default" {
#   path = var.db_path
#   type = "database"
# }

# resource "vault_database_secret_backend_role" "default" {
#   backend             = vault_mount.default.path
#   name                = var.db_backend_role_name
#   db_name             = vault_database_secret_backend_connection.default.name
#   creation_statements = ["CREATE ROLE \"{{name}}\" WITH LOGIN PASSWORD '{{password}}' VALID UNTIL '{{expiration}}';"]
# }


# resource "vault_database_secret_backend_connection" "default" {
#   backend                  = vault_mount.default.path
#   name                     = var.db_backend_connection_name
#   allowed_roles            = ["dev"]
#   root_rotation_statements = ["ALTER ROLE \"{{name}}\" WITH PASSWORD '{{password}}';"]
#   postgresql {
#     connection_url = "postgres://{{username}}:{{password}}@${var.db_hostname}:${var.db_tcp_port}/postgres"
#     username       = var.db_username
#     password       = var.db_password
#   }
# }

# resource "vault_generic_endpoint" "rotate_initial_db_password" {
#   depends_on     = [vault_database_secret_backend_connection.default]
#   path           = "${var.db_path}/rotate-root/${vault_database_secret_backend_connection.default.name}"
#   disable_read   = true
#   disable_delete = true
#   data_json      = "{}"
# }
