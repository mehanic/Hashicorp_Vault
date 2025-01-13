resource "aws_iam_access_key" "vault" {
  user = aws_iam_user.vault.name
}
