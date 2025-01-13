provider "mysql" {
  endpoint = "tcp(${var.host}:${var.port})"
  username = var.username # Use the username from the variable or hardcode
  password = var.password # Use the password from the variable or hardcode
  //tls_ca   = var.server_ca
}