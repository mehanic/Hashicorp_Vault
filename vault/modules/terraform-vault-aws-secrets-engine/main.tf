

# resource "vault_aws_secret_backend" "aws_backend" {
#   access_key = var.aws_access_key
#   secret_key = var.aws_secret_key
#   region     = var.aws_region
#   path       = "aws_first"

#   default_lease_ttl_seconds = var.aws_default_lease
#   max_lease_ttl_seconds     = var.aws_max_lease
# }

# resource "vault_aws_secret_backend_role" "aws_backend_role" {
#   name = var.aws_backend_role_name

#   backend         = vault_aws_secret_backend.aws_backend.path
#   credential_type = var.aws_backend_role_cred_type

#   role_arns       = var.aws_role_arns
#   policy_arns     = var.aws_policy_arns
#   policy_document = var.aws_policy_document
#   iam_groups      = var.aws_iam_groups

#   default_sts_ttl = var.aws_sts_default_ttl
#   max_sts_ttl     = var.aws_sts_max_ttl
# }
