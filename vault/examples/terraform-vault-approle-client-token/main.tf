module "terraform-vault-token" {
  source         = "../../modules/terraform-vault-token"
  token_max_time = 1800       # Maximum lifetime for generated tokens in seconds
  role           = "myrole"   # Name of the role for the use case
  policy         = "mypolicy" # Policy's name
  mount-path     = "app-demo" # Custom path to mount the AppRole auth method
  ttl            = "300s"     # Duration of the auth method in seconds

}
