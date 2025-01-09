resource "vault_mount" "database" {
  path                      = var.path   # Path such as "mongo" or a custom value
  type                      = "database" # Use "database" instead of "mongodb"
  description               = var.description
  default_lease_ttl_seconds = var.default_lease_ttl_seconds
  max_lease_ttl_seconds     = var.max_lease_ttl_seconds
}

resource "vault_database_secret_backend_connection" "mongodb" {
  backend       = var.path # Ensure this matches the mount path you defined
  name          = var.database_name
  allowed_roles = keys(var.mongodb_roles)

  mongodb {
    connection_url = "mongodb://${var.mongodb_username}:${var.mongodb_password}@${var.mongodb_host}:${var.mongodb_port}/${var.mongodb_db_name}?sslmode=disable"
  } //depends_on = [vault_mount.database]
}



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