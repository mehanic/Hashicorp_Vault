module "terraform-vault-postgresql-static-dynamic-role" {
  source         = "../../modules/terraform-vault-postgresql-static-dynamic-role"
  db_username    = "postgres"
  db_password    = "new_password"
  db_host        = "127.0.0.1"
  db_user_static = "postgres"

}
