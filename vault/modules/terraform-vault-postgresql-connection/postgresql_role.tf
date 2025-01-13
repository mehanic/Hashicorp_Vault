resource "postgresql_role" "my_role" {
  name                      = "${var.role_name_prefix}_${var.database}"
  login                     = var.role_login
  password                  = var.role_password != "" ? var.role_password : random_password.password.result
  superuser                 = var.role_superuser
  create_database           = var.role_create_database
  create_role               = var.role_create_role
  inherit                   = var.role_inherit
  replication               = var.role_replication
  bypass_row_level_security = var.role_bypass_row_level_security
  connection_limit          = var.role_connection_limit
  encrypted_password        = var.role_encrypted_password
  roles                     = var.role_roles
  search_path               = var.role_search_path
  valid_until               = var.role_valid_until
  skip_drop_role            = var.role_skip_drop_role
  skip_reassign_owned       = var.role_skip_reassign_owned
  statement_timeout         = var.role_statement_timeout
  assume_role               = var.role_assume_role
}
