resource "vault_generic_endpoint" "rotate_initial_db_password" {
  depends_on     = [vault_database_secret_backend_connection.default]
  path           = "${var.db_path}/rotate-root/${vault_database_secret_backend_connection.default.name}"
  disable_read   = true
  disable_delete = true
  data_json      = "{}"
}
