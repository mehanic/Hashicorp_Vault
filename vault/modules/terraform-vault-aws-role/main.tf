# # Resource for Vault AWS Secret Backend
# resource "vault_aws_secret_backend" "aws_vault_account" {
#   path                      = var.path # Using the path variable
#   access_key                = aws_iam_access_key.vault.id
#   secret_key                = aws_iam_access_key.vault.secret
#   max_lease_ttl_seconds     = 3600
#   default_lease_ttl_seconds = 600
# }
# resource "aws_iam_user" "vault" {
#   name = "vault"
#   path = "/system/"
# }

# resource "aws_iam_access_key" "vault" {
#   user = aws_iam_user.vault.name
# }

# resource "aws_iam_user_policy" "vault_policy" {
#   name = "vault-policy"
#   user = aws_iam_user.vault.name

#   policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Effect": "Allow",
#       "Action": [
#         "iam:CreateAccessKey",
#         "iam:DeleteAccessKey",
#         "iam:DeleteUser",
#         "iam:ListAccessKeys",
#         "iam:ListAttachedUserPolicies",
#         "iam:ListGroupsForUser",
#         "iam:ListUserPolicies",
#         "iam:AddUserToGroup",
#         "iam:RemoveUserFromGroup",
#         "iam:AttachUserPolicy",
#         "iam:CreateUser",
#         "iam:DeleteUserPolicy",
#         "iam:DetachUserPolicy",
#         "iam:PutUserPolicy"
#       ],
#       "Resource": [
#         "arn:aws:iam::${var.aws_account_id}:user/vault-*"
#       ]
#     }
#   ]
# }
# EOF
# }

