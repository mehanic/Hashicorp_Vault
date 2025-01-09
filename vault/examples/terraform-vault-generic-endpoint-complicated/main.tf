module "terraform-vault-generic-endpoint-complicated" {
  source                  = "../../modules/terraform-vault-generic-endpoint-complicated"
  project_id              = "project-777999"
  database_name           = "bwago_development"
  database_username       = "postgres"
  database_password       = "new_password"
  database_server_address = "127.0.0.1"
  database_server_port    = 5432
  ssl_mode                = "prefer"
}

//vault lease revoke -force -prefix project-777999-database/creds/readonly