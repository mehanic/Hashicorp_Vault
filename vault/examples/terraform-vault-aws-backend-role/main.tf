module "terraform-vault-aws-backend-role" {
  source = "../../modules/terraform-vault-aws-backend-role"
name             = "aws_backend_role"
credential_type  = "assumed_role"
policy_arns      = ["arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"]
role_arns        = []
policy_document  = ""
default_sts_ttl  = 3600
max_sts_ttl      = 7200

}