resource "vault_mount" "db" {
  count = var.existing_engine ? 0 : 1

  path = var.vault_mount_path
  type = "database"
}

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

resource "vault_quota_rate_limit" "role" {
  for_each = {
    for key, item in local.db_roles : key => item
    if item.enable_quota
  }

  namespace = var.vault_namespace
  name      = each.value.quota_path

  path = each.value.role_path

  rate           = each.value.rate
  interval       = each.value.interval
  block_interval = each.value.block_interval

  depends_on = [
    vault_database_secret_backend_connection.this,
    vault_database_secret_backend_role.this
  ]
}

resource "vault_quota_lease_count" "role" {
  # enterprise only
  for_each = {
    for key, item in local.db_roles : key => item
    if var.lease_count_enabled
  }

  namespace = var.vault_namespace
  name      = each.value.quota_path

  path       = each.value.role_path
  max_leases = each.value.max_leases
}

//vault lease revoke -force -prefix database/