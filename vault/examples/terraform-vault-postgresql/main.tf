module "terraform-vault-postgresql" {
  source      = "../../modules/terraform-vault-postgresql"
  db          = "postgres-vault-database"
  db_endpoint = "database:5432"
  db_password = "123"
  db_user     = "Dublin"
}
