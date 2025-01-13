resource "vault_database_secret_backend_connection" "postgres" {
  allowed_roles = ["service-write", "dev-read"]
  backend       = vault_mount.database.path
  name          = "postgres-secret-backend"

  // Needed as SSL is disabled on postgres Docker container
  verify_connection = false

  postgresql {
    // sslmode=disable needed for the Postgres Go Client
    connection_url = "postgres://${var.db_user}:${var.db_password}@${var.db_endpoint}/${var.db}?sslmode=disable"
  }
}
