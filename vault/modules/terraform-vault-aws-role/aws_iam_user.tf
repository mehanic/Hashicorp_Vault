resource "aws_iam_user" "vault" {
  name = "vault"
  path = "/system/"
}