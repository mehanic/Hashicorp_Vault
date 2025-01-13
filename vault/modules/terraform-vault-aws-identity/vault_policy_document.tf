data "vault_policy_document" "default" {
  rule {
    path         = "aws/creds/{{identity.groups.names.aws-creds.metadata.env}}-{{identity.groups.names.aws-creds.metadata.service}}"
    capabilities = ["read"]
    description  = "Allow generating credentials"
  }
}