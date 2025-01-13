resource "vault_database_secret_backend_connection" "mongodb" {
  backend       = var.path # Ensure this matches the mount path you defined
  name          = var.database_name
  allowed_roles = keys(var.mongodb_roles)

  mongodb {
    connection_url = "mongodb://${var.mongodb_username}:${var.mongodb_password}@${var.mongodb_host}:${var.mongodb_port}/${var.mongodb_db_name}?sslmode=disable"
  } //depends_on = [vault_mount.database]
}
