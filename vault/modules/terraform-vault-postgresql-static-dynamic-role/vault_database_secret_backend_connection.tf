# resource "vault_database_secret_backend_connection" "postgres" {
#   backend       = vault_mount.db.path
#   plugin_name   = "postgresql-database-plugin"
#   name          = "postgres"
#   allowed_roles = ["postgres_dynamic_creds", "postgres_static_role"]

#   postgresql {
#     connection_url    = "postgres://${var.db_username}:${var.db_password}@${var.db_host}:5432/postgres"
#     username          = var.db_username
#     password          = var.db_password
#     username_template = "vault-psql-{{random 3}}"
#   }
# }
