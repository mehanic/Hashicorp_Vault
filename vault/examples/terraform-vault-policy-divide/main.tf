module "terraform-vault-policy-divide" {
  source                = "../../modules/terraform-vault-policy-divide"
  userpass_path         = "auth/userpass"
  developers_path       = "developers"
  operations_path       = "operations"
  secret_username       = "foo"
  secret_password       = "bar"
  admin_policy_file     = "policies/admin_policy.hcl"
  developer_policy_file = "policies/developer_policy.hcl"
  operation_policy_file = "policies/operation_policy.hcl"

  admin_policy_code = <<EOT
# Manage auth methods broadly across Vault
path "auth/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Create, update, and delete auth methods
path "sys/auth/*"
{
  capabilities = ["create", "update", "delete", "sudo"]
}

# List auth methods
path "sys/auth"
{
  capabilities = ["read"]
}

# List existing policies
path "sys/policies/acl"
{
  capabilities = ["list"]
}

# Create and manage ACL policies
path "sys/policies/acl/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# List, create, update, and delete key/value secrets
path "secret/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Manage secrets engines
path "sys/mounts/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# List existing secrets engines.
path "sys/mounts"
{
  capabilities = ["read"]
}

# Read health checks
path "sys/health"
{
  capabilities = ["read", "sudo"]
}

path "operations/*"
{
  capabilities = ["create", "read", "update", "delete", "list"]
}

path "developers/*"
{
  capabilities = ["create", "read", "update", "delete", "list"]
}
EOT

  developer_policy_code = <<EOT
path "developers/*"
{
  capabilities = ["list"]
}

path "developers/data/user"
{
  capabilities = ["create", "read", "update", "delete", "list"]
}
EOT

  operation_policy_code = <<EOT
path "operations/*"
{
  capabilities = ["create", "read", "update", "delete", "list"]
}
EOT


}
