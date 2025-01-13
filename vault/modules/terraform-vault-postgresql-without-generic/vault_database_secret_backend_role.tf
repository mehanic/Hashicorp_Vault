resource "vault_database_secret_backend_role" "postgres" {
  backend               = vault_mount.postgres.path
  name                  = local.role_name
  db_name               = vault_database_secret_backend_connection.postgres.name
  creation_statements   = var.creation_statements
  revocation_statements = var.revocation_statements
  default_ttl           = var.default_ttl
  max_ttl               = var.max_ttl
}