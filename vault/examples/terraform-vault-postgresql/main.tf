module "terraform-vault-postgresql" {
  source      = "../../modules/terraform-vault-postgresql"
  db          = "postgres-vault-database"
  db_endpoint = "127.0.0.1:5432"
  db_password = "new_password"
  db_user     = "postgres"
}
