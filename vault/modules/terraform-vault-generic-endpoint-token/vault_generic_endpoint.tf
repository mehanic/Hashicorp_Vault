resource "vault_generic_endpoint" "this" {
  path           = "${var.vault_mount_postgres_path}/rotate-root/${vault_database_secret_backend_connection.this.name}"
  disable_read   = true
  disable_delete = true

  data_json = "{}"

}