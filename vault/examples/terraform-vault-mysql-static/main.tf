module "terraform-vault-mysql-static" {
  source = "../../modules/terraform-vault-mysql-static"
# MySQL server configuration
mysql_host     = "127.0.0.1"
mysql_username = "root"
mysql_password = "new_password"

# Allowed roles for connecting to the DB secrets backend
allowed_roles = ["role1", "role2"]

# Database name used in the backend role
db_name = "test_db"

}