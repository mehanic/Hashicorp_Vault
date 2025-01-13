
resource "vault_aws_secret_backend_role" "acmevault" {
  backend         = vault_mount.aws.path # This dynamically references the path
  name            = "acmevault"
  credential_type = "iam_user"

  policy_document = <<EOT
  {
     "Version": "2012-10-17",
     "Statement": [
         {
             "Effect": "Allow",
             "Action": [
                 "route53:GetChange",
                 "route53:ChangeResourceRecordSets",
                 "route53:ListResourceRecordSets"
             ],
             "Resource": [
                 "arn:aws:route53:::hostedzone/*",
                 "arn:aws:route53:::change/*"
             ]
         },
         {
             "Effect": "Allow",
             "Action": "route53:ListHostedZonesByName",
             "Resource": "*"
         }
     ]
  }
  EOT
}
