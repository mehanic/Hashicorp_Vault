resource "vault_database_secret_backend_role" "this" {
  for_each = local.db_roles
  name     = each.value.role_name
  backend  = var.vault_mount_path

  db_name = vault_database_secret_backend_connection.this.name

  creation_statements   = each.value["creation_statements"]
  revocation_statements = each.value["revocation_statements"]
  renew_statements      = each.value["renew_statements"]
  rollback_statements   = each.value["rollback_statements"]

  max_ttl     = each.value.max_ttl
  default_ttl = each.value.default_ttl

  depends_on = [
    vault_database_secret_backend_connection.this
  ]
}
