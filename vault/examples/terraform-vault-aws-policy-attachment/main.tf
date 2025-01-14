module "terraform-vault-aws-policy-attachment" {
  source     = "../../modules/terraform-vault-aws-policy-attachment"
  aws_region = "eu-central-1"

  # Define dependencies for the Vault mount if needed (adjust as appropriate)
  # Example: module_depends_on = [module.some_dependency]
  module_depends_on = []
}
