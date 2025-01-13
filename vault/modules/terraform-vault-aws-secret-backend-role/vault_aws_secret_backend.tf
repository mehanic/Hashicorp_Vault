resource "vault_aws_secret_backend" "aws_vault_account" {
  path       = var.aws_secret_backend_path
  access_key = aws_iam_access_key.vault.id
  secret_key = aws_iam_access_key.vault.secret
  region     = "us-east-1"
}
