resource "vault_database_secret_backend_role" "mysql_dynamic_creds" {
  backend               = vault_mount.mysql.path
  name                  = "mysql_dynamic_creds"
  db_name               = vault_database_secret_backend_connection.mysql.name
  creation_statements   = ["CREATE USER '{{name}}'@'%' IDENTIFIED BY '{{password}}';GRANT ALL ON ${var.db_name}.* TO '{{name}}'@'%';"]
  revocation_statements = ["DROP USER '{{name}}'@'%';"]
  default_ttl           = "300"
}
