resource "vault_database_secret_backend_role" "db_roles" {
  for_each            = local.db_role_map
  backend             = vault_mount.database.path
  name                = "${vault_database_secret_backend_connection.devbox_mysql.name}_${each.value.rolename}"
  db_name             = vault_database_secret_backend_connection.devbox_mysql.name
  creation_statements = ["CREATE USER '{{name}}'@'%' IDENTIFIED BY '{{password}}'; GRANT ${each.value.privileges} TO '{{name}}'@'%';"]
  default_ttl         = each.value.default_ttl
  max_ttl             = each.value.max_ttl
}
