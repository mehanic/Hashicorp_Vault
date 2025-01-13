provider "postgresql" {
  host     = var.db_host
  port     = var.db_port
  database = var.db_name
  username = var.db_username
  password = var.db_password
  sslmode  = var.ssl_mode
}
