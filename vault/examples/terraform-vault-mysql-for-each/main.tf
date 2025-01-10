module "terraform-vault-mysql-for-each" {
  source = "../../modules/terraform-vault-mysql-for-each"
  mysql_host     = "127.0.0.1"
mysql_username = "root"
mysql_password = "new_password" 

allowed_roles = ["*"]

db_roles = [
  {
    rolename    = "application_dba"
    privileges  = "ALL PRIVILEGES ON application.*"
    default_ttl = 300
    max_ttl     = 3000
  },
  {
    rolename    = "customer_analytics"
    privileges  = "SELECT ON customer.*"
    default_ttl = 60
    max_ttl     = 600
  },
  {
    rolename    = "customer_dba"
    privileges  = "ALL PRIVILEGES ON customer.*"
    default_ttl = 300
    max_ttl     = 3000
  }
]

  

}