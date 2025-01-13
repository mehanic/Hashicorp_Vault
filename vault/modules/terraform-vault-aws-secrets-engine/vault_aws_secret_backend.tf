resource "vault_aws_secret_backend" "aws_backend" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.aws_region
  path       = "aws_first"

  default_lease_ttl_seconds = var.aws_default_lease
  max_lease_ttl_seconds     = var.aws_max_lease
}
