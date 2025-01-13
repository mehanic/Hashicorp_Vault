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
