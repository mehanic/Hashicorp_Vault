# AWS secret backend configuration
resource "vault_aws_secret_backend" "aws" {
  #   access_key = "${var.access_key}"
  #   secret_key = "${var.secret_key}"
  //  region     = var.aws_region
  region = "us-east-1"

  default_lease_ttl_seconds = 120
  max_lease_ttl_seconds     = 240
}

# Create an AWS role for EC2 admin with assumed role policy
resource "vault_aws_secret_backend_role" "ec2-admin" {
  backend         = vault_aws_secret_backend.aws.path
  name            = "my-role"
  credential_type = "assumed_role"

  policy_document = <<EOT
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "ec2:DescribeInstances",
      "Resource": "*"
    }
  ]
}
EOT
}
