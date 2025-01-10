resource "vault_mount" "mysql" {
  path = "mysql_dynamic_static"
  type = "database"
}

resource "vault_database_secret_backend_connection" "mysql" {
  backend       = vault_mount.mysql.path
  plugin_name   = "mysql-database-plugin"
  name          = "mysql"
  allowed_roles = var.allowed_roles

  mysql {
    connection_url    = "{{username}}:{{password}}@tcp(${var.mysql_host}:3306)/"
    username          = var.mysql_username
    password          = var.mysql_password
    username_template = "vault-mysql-{{random 3}}"
  }
}

resource "vault_database_secret_backend_role" "mysql_dynamic_creds" {
  backend               = vault_mount.mysql.path
  name                  = "mysql_dynamic_creds"
  db_name               = vault_database_secret_backend_connection.mysql.name
  creation_statements   = ["CREATE USER '{{name}}'@'%' IDENTIFIED BY '{{password}}';GRANT ALL ON ${var.db_name}.* TO '{{name}}'@'%';"]
  revocation_statements = ["DROP USER '{{name}}'@'%';"]
  default_ttl           = "300"
}

resource "vault_database_secret_backend_static_role" "mysql_static_role" {
  backend             = vault_mount.mysql.path
  name                = "mysql_static_role"
  db_name             = vault_database_secret_backend_connection.mysql.name
  username            = "dbadmin"
  rotation_period     = 600
  rotation_statements = ["ALTER USER '{{name}}'@'%' IDENTIFIED BY '{{password}}';"]
}

#  Error: error creating static role "mysql_static_role" for backend "mysql_dynamic_static": Error making API request.
# │ 
# │ URL: PUT http://127.0.0.1:8200/v1/mysql_dynamic_static/static-roles/mysql_static_role
# │ Code: 500. Errors:
# │ 
# │ * 1 error occurred:
# │ 	* "mysql_static_role" is not an allowed role
# │ 
# │ 


# path "mysql_dynamic_static/static-roles/*" {
#   capabilities = ["create", "read", "update", "delete", "list"]
# }
# path "mysql_dynamic_static/roles/*" {
#   capabilities = ["create", "read", "update", "delete", "list"]
# }
