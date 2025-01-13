resource "vault_database_secret_backend_static_role" "mysql_static_role" {
  backend             = vault_mount.mysql.path
  name                = "mysql_static_role"
  db_name             = vault_database_secret_backend_connection.mysql.name
  username            = "dbadmin"
  rotation_period     = 600
  rotation_statements = ["ALTER USER '{{name}}'@'%' IDENTIFIED BY '{{password}}';"]
}