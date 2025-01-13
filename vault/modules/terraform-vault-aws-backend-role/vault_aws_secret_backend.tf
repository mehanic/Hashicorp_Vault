resource "vault_aws_secret_backend" "this" {
  path = var.path # Path where the AWS secrets engine will be enabled
}