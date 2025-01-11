module "terraform-vault-aws-role" {
  source = "../../modules/terraform-vault-aws-role"
  # terraform.tfvars
  path           = "aws_vault_account"
  aws_account_id = ""

}
