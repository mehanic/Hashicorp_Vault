provider "aws" {
    region = var.aws_region
}

data "aws_caller_identity" "current" {}

resource "aws_iam_role" "iac_admin_role" {
  name = "iac-admin-role"

  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Statement1",
            "Effect": "Allow",
            "Principal": {
                "AWS": "${data.aws_caller_identity.current.arn}"
            },
            "Action": "sts:AssumeRole"
        }
    ]
  })
  tags = {
    tag-key = "tag-value"
  }
}

resource "aws_iam_role_policy_attachment" "test-attach" {
  role       = aws_iam_role.iac_admin_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}


resource "vault_aws_secret_backend_role" "terraform_role" {
  backend          = vault_mount.aws.path
  name             = "terraform-role"
  credential_type  = "assumed_role"
  role_arns        = [ aws_iam_role.iac_admin_role.arn ]
}
