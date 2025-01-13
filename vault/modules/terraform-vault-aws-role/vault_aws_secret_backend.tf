resource "vault_aws_secret_backend" "aws_vault_account" {
  path                      = var.path # Using the path variable
  access_key                = aws_iam_access_key.vault.id
  secret_key                = aws_iam_access_key.vault.secret
  max_lease_ttl_seconds     = 3600
  default_lease_ttl_seconds = 600
}