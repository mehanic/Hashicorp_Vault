resource "vault_database_secret_backend_role" "mongodb" {
  for_each = var.mongodb_roles
  backend  = var.path # Ensure it matches the mount path
  name     = each.key
  db_name  = vault_database_secret_backend_connection.mongodb.name

  creation_statements = [
    jsonencode({
      db    = "admin"
      roles = each.value
    })
  ]

  depends_on = [vault_database_secret_backend_connection.mongodb]
}