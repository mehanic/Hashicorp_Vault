resource "vault_mount" "aws" {
  path        = "aws_vault"
  type        = "aws"
  description = "AWS secrets engine for dynamic credentials"
}
