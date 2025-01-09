resource "vault_database_secret_backend_role" "this" {
  backend             = try(var.backend.path, var.backend)
  name                = var.name
  db_name             = var.db_name
  creation_statements = var.creation_statements
  default_ttl         = var.default_ttl
  max_ttl             = var.max_ttl
}