locals {
  role_name = var.role_name == "" ? var.name : var.role_name
}

resource "vault_mount" "postgres" {
  path = "${var.database_path}/${var.name}"
  type = "database"
}

resource "vault_database_secret_backend_connection" "postgres" {
  backend       = vault_mount.postgres.path
  name          = var.name
  allowed_roles = var.allowed_roles

  postgresql {
    connection_url = "postgresql://{{username}}:{{password}}@${local.database_address}:${local.database_port}/${var.postgres_database_name}?${var.additional_connection_string_arguments}"
    username       = var.postgres_username
    password       = var.postgres_password
  }
}

resource "vault_database_secret_backend_role" "postgres" {
  backend               = vault_mount.postgres.path
  name                  = local.role_name
  db_name               = vault_database_secret_backend_connection.postgres.name
  creation_statements   = var.creation_statements
  revocation_statements = var.revocation_statements
  default_ttl           = var.default_ttl
  max_ttl               = var.max_ttl
}

data "vault_policy_document" "postgres" {
  rule {
    path         = "${vault_mount.postgres.path}/creds/${vault_database_secret_backend_role.postgres.name}"
    capabilities = ["read"]
    description  = "Allow read access to database credentials at ${vault_mount.postgres.path}"
  }
}

resource "vault_policy" "postgres" {
  name   = local.role_name
  policy = data.vault_policy_document.postgres.hcl
}

resource "vault_kubernetes_auth_backend_role" "postgres" {
  count                            = local.set_up_kubernetes_auth ? 1 : 0
  backend                          = var.vault_kubernetes_auth_path
  role_name                        = vault_database_secret_backend_role.postgres.name
  bound_service_account_names      = var.bound_service_account_names
  bound_service_account_namespaces = var.bound_service_account_namespaces
  token_ttl                        = var.default_ttl
  token_policies                   = [vault_policy.postgres.name]
}