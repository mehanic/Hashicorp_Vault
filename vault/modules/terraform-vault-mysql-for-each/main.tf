resource "vault_mount" "database" {
  path        = "db"
  type        = "database"
  description = "database secret engine mount"
}

resource "vault_database_secret_backend_connection" "devbox_mysql" {
  backend       = vault_mount.database.path
  name          = "devbox_mysql"
  allowed_roles = var.allowed_roles

  mysql {
    connection_url = "{{username}}:{{password}}@tcp(${var.mysql_host}:3306)/"
    username       = var.mysql_username
    password       = var.mysql_password
  }
}

locals {
  # Convert db_roles variable to a map for for_each
  db_role_map = { for role in var.db_roles : role.rolename => role }
}

resource "vault_database_secret_backend_role" "db_roles" {
  for_each            = local.db_role_map
  backend             = vault_mount.database.path
  name                = "${vault_database_secret_backend_connection.devbox_mysql.name}_${each.value.rolename}"
  db_name             = vault_database_secret_backend_connection.devbox_mysql.name
  creation_statements = ["CREATE USER '{{name}}'@'%' IDENTIFIED BY '{{password}}'; GRANT ${each.value.privileges} TO '{{name}}'@'%';"]
  default_ttl         = each.value.default_ttl
  max_ttl             = each.value.max_ttl
}

resource "vault_policy" "db_roles" {
  for_each = local.db_role_map
  name     = "${vault_database_secret_backend_role.db_roles[each.key].name}_policy"
  policy   = <<EOF
path "${vault_mount.database.path}/creds/${vault_database_secret_backend_role.db_roles[each.key].name}" {
  capabilities = ["read"]
}
EOF
}
