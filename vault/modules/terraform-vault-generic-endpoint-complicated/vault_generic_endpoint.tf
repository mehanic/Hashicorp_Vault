resource "vault_generic_endpoint" "this" {
  path           = "${vault_database_secret_backend_connection.this.backend}/rotate-root/${vault_database_secret_backend_connection.this.name}"
  disable_read   = true
  disable_delete = true

  data_json = "{}"
}
