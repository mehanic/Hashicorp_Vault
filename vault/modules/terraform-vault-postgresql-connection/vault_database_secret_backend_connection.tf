# Vault database connection configuration
resource "vault_database_secret_backend_connection" "postgres" {
  name              = var.database_name
  backend           = try(var.backend.path, var.backend)
  verify_connection = var.verify_connection
  root_rotation_statements = [
    "ALTER ROLE \"${postgresql_role.my_role.name}\" WITH PASSWORD '{{password}}';"
  ]

  allowed_roles = var.allowed_roles
  lifecycle {
    ignore_changes = [
      postgresql
    ]
  }

  postgresql {
    connection_url          = "postgres://${var.db_username}:${var.db_password}@${var.db_host}:${var.db_port}/${var.db_name}?sslmode=${var.ssl_mode}"
    max_open_connections    = var.max_open_connections
    max_idle_connections    = var.max_idle_connections
    max_connection_lifetime = var.max_connection_lifetime
  }
  data = {
    username = postgresql_role.my_role.name
    password = postgresql_role.my_role.password
  }

  # data = {
  #   username = var.db_username  # Use the username for root credential rotation
  #   password = var.db_password  # Use the root password here
  # }

}

# resource "vault_generic_endpoint" "rotate_root" {
#   path                 = "${vault_database_secret_backend_connection.postgres.backend}/rotate-root/${vault_database_secret_backend_connection.postgres.name}"
#   ignore_absent_fields = true
#   disable_read         = true
#   disable_delete       = true
#   data_json            = "{}"
#   depends_on = [
#     vault_database_secret_backend_connection.postgres
#   ]
# }



# resource "vault_database_secret_backend_role" "vault_role" {
#   name           = "vault-role"
#   backend        = vault_database_secret_backend_connection.postgres.name
#   db_name        = vault_database_secret_backend_connection.postgres.name
#   creation_statements = [
#     "CREATE ROLE \"{{name}}\" WITH LOGIN PASSWORD '{{password}}';",
#     "GRANT CONNECT ON DATABASE \"${var.db_name}\" TO \"{{name}}\";"
#   ]
#   default_ttl    = "1h"
#   max_ttl        = "24h"
# }
