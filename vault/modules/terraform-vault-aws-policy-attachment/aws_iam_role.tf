resource "aws_iam_role" "iac_admin_role" {
  name = "iac-admin-role"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "Statement1",
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : "${data.aws_caller_identity.current.arn}"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })
  tags = {
    tag-key = "tag-value"
  }
}