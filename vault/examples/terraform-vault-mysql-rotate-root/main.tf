module "terraform-vault-mysql-rotate-root" {
  source = "../../modules/terraform-vault-mysql-rotate-root"

  # terraform.tfvars

  port                = 3306
  database            = "mysql"
  backend             = "mysql-static"
  server_ca           = null
  verify_connection   = true
  allowed_roles       = null
  user_name_prefix    = "vault"
  login_name_suffix   = ""
  skip_reassign_owned = true
  name                = "root"
  host                = "127.0.0.1"
  password            = "1111"
  username            = "root"
  grants = {
    "*" = [
      "SELECT", "INSERT", "UPDATE", "DELETE", "CREATE", "DROP",
      "RELOAD", "PROCESS", "REFERENCES", "INDEX", "ALTER", "SHOW DATABASES",
      "CREATE TEMPORARY TABLES", "LOCK TABLES", "EXECUTE",
      "REPLICATION SLAVE", "REPLICATION CLIENT", "CREATE VIEW",
      "SHOW VIEW", "CREATE ROUTINE", "ALTER ROUTINE", "CREATE USER",
      "EVENT", "TRIGGER"
    ]
  }


}