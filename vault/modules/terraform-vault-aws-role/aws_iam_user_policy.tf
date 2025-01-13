
resource "aws_iam_user_policy" "vault_policy" {
  name = "vault-policy"
  user = aws_iam_user.vault.name

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "iam:CreateAccessKey",
        "iam:DeleteAccessKey",
        "iam:DeleteUser",
        "iam:ListAccessKeys",
        "iam:ListAttachedUserPolicies",
        "iam:ListGroupsForUser",
        "iam:ListUserPolicies",
        "iam:AddUserToGroup",
        "iam:RemoveUserFromGroup",
        "iam:AttachUserPolicy",
        "iam:CreateUser",
        "iam:DeleteUserPolicy",
        "iam:DetachUserPolicy",
        "iam:PutUserPolicy"
      ],
      "Resource": [
        "arn:aws:iam::${var.aws_account_id}:user/vault-*"
      ]
    }
  ]
}
EOF
}

