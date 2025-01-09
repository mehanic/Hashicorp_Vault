module "terraform-vault-snowflake" {
  source                   = "../../modules/terraform-vault-snowflake"
  snowflake_username       = "snowflake"
  role_name                = "ACCOUNTADMIN"
  snowflake_connection_url = "https://<account_name>.snowflakecomputing.com/?user=<username>&password=<password>&role=<role>&warehouse=<warehouse>&database=<database>&schema=<schema>"
  vault_db_path            = "vault_snowflake"
  vault_db_role            = "demo"
  vault_db_role_creation_statements = [
    "CREATE USER {{name}} PASSWORD = '{{password}}' DAYS_TO_EXPIRY = {{expiration}};"
  ]
  default_ttl = 300
  max_ttl     = 3600


}
