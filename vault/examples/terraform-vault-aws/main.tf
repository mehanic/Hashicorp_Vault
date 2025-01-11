module "terraform-vault-aws" {
  source = "../../modules/terraform-vault-aws"
 # Path mappings for the AWS backends
backend_paths = {
  "aws" = "aws-vault"
}

# Name of the Vault role
name = "aws-vault"

# List of standard rule names to use
named_rules = ["audit_reader", "audit_manager"]

# Custom rules for fine-grained access control
rules = [
  {
    path               = "secret/data/team/*"
    capabilities       = ["read", "list"]
    description        = "Read and list secrets for the team"
    allowed_parameters = {
      "ttl" = ["30m", "1h"]
    }
    denied_parameters  = {
      "max_ttl" = ["2h"]
    }
  },
  {
    path               = "sys/policies/acl/*"
    capabilities       = ["create", "read", "update", "delete"]
    description        = "Manage ACL policies"
    allowed_parameters = {}
    denied_parameters  = {}
  }
]

# Token Time-To-Live settings
token_ttl     = 72000  # 20 hours
token_max_ttl = 72000  # 20 hours

# TTL for wrapping secret_id
wrapping_ttl = 3600  # 1 hour

# List of IAM role ARNs allowed access
login_role_arns = ["arn:aws:iam::123456789012:role/example-role"]

}
