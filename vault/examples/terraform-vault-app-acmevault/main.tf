module "terraform-vault-app-acmevault" {
  source      = "../../modules/terraform-vault-app-acmevault"
  aws_path    = "aws_vault"
  path_prefix = "/secret/data/acmevault"

}
