module "terraform-vault-userpass" {
  source = "../../modules/terraform-vault-userpass"
  # Terraform variables for Vault token resource
  mount-path = "admin-demo" # Custom path to mount the userpass auth method
  ttl        = "300s"       # Duration of the auth method in seconds
  policy     = "mypolicy"   # Name of the policy
  user       = "intern"     # Username

}
