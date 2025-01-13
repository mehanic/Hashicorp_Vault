resource "vault_database_secret_backend_connection" "this" {
  backend   = var.vault_mount_path
  name      = var.connection_name
  namespace = var.vault_namespace

  allowed_roles = local.allowed_roles

  mysql {
    connection_url = "{{username}}:{{password}}@tcp(${var.db_url})/"

    username_template       = "${var.username_prefix}${var.username_template}"
    tls_ca                  = var.tls_ca
    tls_certificate_key     = var.tls_certificate_key
    username                = var.db_username
    password                = var.db_password
    max_connection_lifetime = var.max_connection_lifetime
    max_idle_connections    = var.max_idle_connections
    max_open_connections    = var.max_open_connections
  }

  depends_on = [
    vault_mount.db
  ]
}
