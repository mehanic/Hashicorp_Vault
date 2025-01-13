resource "aws_iam_role_policy_attachment" "test-attach" {
  role       = aws_iam_role.iac_admin_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}