module "terraform-vault-role-aws" {
  source = "../../modules/terraform-vault-role-aws"
  # terraform.tfvars
  path           = "aws_vault_account"
  aws_account_id = ""

}
