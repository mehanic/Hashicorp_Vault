resource "vault_aws_secret_backend_role" "terraform_role" {
  backend         = vault_mount.aws.path
  name            = "terraform-role"
  credential_type = "assumed_role"
  role_arns       = [aws_iam_role.iac_admin_role.arn]
}
