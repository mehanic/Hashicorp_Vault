locals {
  # --- The connection string for the database can contain more than one host, so handling string creation for that case here.
  database_address = join(",", [for address in var.database_addresses : "${address}:${var.database_port}"])
}


# variable "vault_mount_postgres_path" {
#   default = "database"  # Change to "postgres" if that is your intended path
# }

# vault secrets enable -path=postgres database                          

# Success! Enabled the database secrets engine at: postgres/

resource "vault_database_secret_backend_connection" "this" {
  plugin_name = "postgresql-database-plugin"
  backend     = var.vault_mount_postgres_path
  name        = var.database_connection_name
  allowed_roles = [
    for role in var.database_roles : role.name
  ]
  #verify_connection = true

  data = {
    "username" = var.database_username
    "password" = var.database_password
  }

  postgresql {
    connection_url = "postgresql://{{username}}:{{password}}@${local.database_address}/${var.database_name}?sslmode=${var.database_sslmode}"
    username       = var.database_username
    password       = var.database_password
  }
}

resource "vault_generic_endpoint" "this" {
  path           = "${var.vault_mount_postgres_path}/rotate-root/${vault_database_secret_backend_connection.this.name}"
  disable_read   = true
  disable_delete = true

  data_json = "{}"

}

resource "vault_database_secret_backend_role" "this" {
  for_each            = { for role in var.database_roles : role.name => role }
  backend             = var.vault_mount_postgres_path
  name                = each.value.name
  db_name             = vault_database_secret_backend_connection.this.name
  creation_statements = each.value.creation_statements
}

resource "vault_policy" "this" {
  for_each = { for role in vault_database_secret_backend_role.this : role.name => role }

  name   = each.value.name
  policy = <<EOH
path "${each.value.backend}/creds/${each.value.name}" {
    capabilities = ["read"]
}
EOH 
}

resource "vault_token" "this" {
  no_parent = true
  period    = "24h"
  policies = concat([
    for policy in vault_policy.this : policy.name
    ], [
    "revoke_lease"
  ])
  metadata = {
    "purpose" = "service-account"
  }
}