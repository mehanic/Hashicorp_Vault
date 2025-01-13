resource "vault_database_secret_backend_role" "this" {
  for_each            = { for role in var.database_roles : role.name => role }
  backend             = var.vault_mount_postgres_path
  name                = each.value.name
  db_name             = vault_database_secret_backend_connection.this.name
  creation_statements = each.value.creation_statements
}
