module "terraform-vault-postgresql-connection" {
  source      = "../../modules/terraform-vault-postgresql-connection"
  db_host     = "127.0.0.1"
  db_port     = 5432
  db_name     = "postgres"
  db_username = "postgres"
  db_password = "new_password" # Consider using a secret management tool
  ssl_mode    = "disable"

  role_name_prefix               = "vault"
  role_login                     = true
  role_password                  = "" # Leave blank to generate a random password
  role_superuser                 = false
  role_create_database           = false
  role_create_role               = true
  role_inherit                   = true
  role_replication               = false
  role_bypass_row_level_security = false
  role_connection_limit          = -1
  role_encrypted_password        = true
  role_roles                     = [] # List roles if applicable, e.g., ["postgres"]
  role_search_path               = []
  role_valid_until               = "infinity"
  role_skip_drop_role            = false
  role_skip_reassign_owned       = true
  role_statement_timeout         = "0"
  role_assume_role               = null

  database_name           = "vault-postgres-one"
  allowed_roles           = ["dev", "prod"]
  max_open_connections    = 10
  max_idle_connections    = 5
  max_connection_lifetime = 3600
  backend                 = "postgresql-database"
  verify_connection       = true
  login_name_suffix       = ""
  database                = "bwago_development"



}
