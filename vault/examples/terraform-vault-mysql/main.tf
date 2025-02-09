module "terraform-vault-mysql" {
  source = "../../modules/terraform-vault-mysql"
  roles = [
    {
      role_name     = "role-db-1"
      database_name = "db-1"
      creation_statements = [
        "CREATE USER '{{name}}'@'%' IDENTIFIED BY '{{password}}';",
        "GRANT SELECT, UPDATE, INSERT, DELETE, ALTER, CREATE, DROP, ALTER, INDEX ON `db-1`.* TO '{{name}}'@'%';"
      ]
      default_ttl = "4m"
      max_ttl     = "10m"
      quota = {
        max_leases     = 10
        rate           = 10
        interval       = 10
        block_interval = 10
      }
    },
    {
      role_name     = "role-db-2"
      database_name = "db-2"
      creation_statements = [
        "CREATE USER '{{name}}'@'%' IDENTIFIED BY '{{password}}';",
        "GRANT SELECT, UPDATE, INSERT, DELETE, ALTER, CREATE, DROP, ALTER, INDEX ON `db-2`.* TO '{{name}}'@'%';"
      ]
      default_ttl = "4m"
      max_ttl     = "10m"
      quota = {
        max_leases     = 10
        rate           = 10
        interval       = 10
        block_interval = 10
      }
    }
  ]

  connection_name = "mysql"
  allowed_roles   = []

  db_url      = "127.0.0.1:3306"
  db_username = "root"
  db_password = "new_password"

  username_prefix   = "v-"
  username_template = "{{.RoleName}}-{{(random 8)}}"

  tls_ca              = ""
  tls_certificate_key = ""

  max_connection_lifetime = null
  max_idle_connections    = null
  max_open_connections    = null

  vault_namespace    = "root"
  vault_mount_path   = "database"
  existing_engine    = false
  token_display_name = "dynamic-engine-vending-admin"

  lease_count_enabled = false

  default_creation_statements = [
    "CREATE USER '{{name}}'@'%' IDENTIFIED BY '{{password}}';",
    "GRANT SELECT ON *.* TO '{{name}}'@'%';"
  ]
  default_revocation_statements = null
  default_renew_statements      = null
  default_rollback_statements   = null

  default_ttl        = 240
  default_max_ttl    = "600"
  default_max_leases = "100"

  default_rate_limit_rate           = "10"
  default_rate_limit_interval       = "1"
  default_rate_limit_block_interval = "10"


}

# mysql -u v-role-db-1-TAwbDauM -pCBaLuGAf-eH82i23Gcuy                                                   1 (0.014s) < 21:26:22
# mysql: [Warning] Using a password on the command line interface can be insecure.
# Welcome to the MySQL monitor.  Commands end with ; or \g.
# Your MySQL connection id is 44
# Server version: 8.0.40-0ubuntu0.24.04.1 (Ubuntu)

# Copyright (c) 2000, 2024, Oracle and/or its affiliates.

# Oracle is a registered trademark of Oracle Corporation and/or its
# affiliates. Other names may be trademarks of their respective
# owners.

# Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

# mysql> 

