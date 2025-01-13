# locals {
#   //vault_db_path = "${vault_mount.database.path}-database"
#   local_connection_name = "${var.project_id}-${var.database_name}"
# }


# resource "vault_mount" "database" {
#   path        = "project-777999-database"
#   type        = "database"
#   description = "Database secrets engine for project 777999"
# }

# resource "vault_database_secret_backend_connection" "this" {
#   backend = vault_mount.database.path
#   name    = var.database_name
#   allowed_roles = [
#     "readonly"
#   ]
#   data = {
#     "username" = var.database_username
#     "password" = var.database_password
#   }

#   postgresql {
#     username          = var.database_username
#     password          = var.database_password
#     connection_url    = "postgresql://{{username}}:{{password}}@${var.database_server_address}:${var.database_server_port}/${var.database_name}?sslmode=${var.ssl_mode}"
#     username_template = "${var.project_id}-{{.RoleName}}-{{unix_time}}-{{random 8}}"
#   }
# }

# resource "vault_generic_endpoint" "this" {
#   path           = "${vault_database_secret_backend_connection.this.backend}/rotate-root/${vault_database_secret_backend_connection.this.name}"
#   disable_read   = true
#   disable_delete = true

#   data_json = "{}"
# }

# resource "vault_database_secret_backend_role" "readonly" {
#   backend = vault_database_secret_backend_connection.this.backend
#   name    = "readonly"
#   db_name = vault_database_secret_backend_connection.this.name
#   creation_statements = [
#     "CREATE ROLE \"{{name}}\" WITH LOGIN PASSWORD '{{password}}' VALID UNTIL '{{expiration}}';",
#     "GRANT CONNECT ON DATABASE ${var.database_name} TO \"{{name}}\";",
#     "GRANT USAGE ON SCHEMA public TO \"{{name}}\";",
#     "GRANT SELECT ON ALL TABLES IN SCHEMA public TO \"{{name}}\";",
#   ]
# }

