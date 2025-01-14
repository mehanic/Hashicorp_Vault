module "terraform-vault-userpass-user1" {
  source         = "../../modules/terraform-vault-userpass-user1"
  login_username = "toronto-vault-user"
  login_password = "my-long-password"

}
