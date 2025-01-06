variable "userpass_path" {
  type    = string
  default = "auth/userpass"
}

variable "developers_path" {
  type    = string
  default = "developers"
}

variable "operations_path" {
  type    = string
  default = "operations"
}

variable "secret_username" {
  type    = string
  default = "foo"
}

variable "secret_password" {
  type    = string
  default = "bar"
}

variable "admin_policy_file" {
  type    = string
  default = "policies/admin_policy.hcl"
}

variable "developer_policy_file" {
  type    = string
  default = "policies/developer_policy.hcl"
}

variable "operation_policy_file" {
  type    = string
  default = "policies/operation_policy.hcl"
}


variable "admin_policy_code" {
  description = "Content of the policy to be created"
  default     = <<EOT
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
}

variable "developer_policy_code" {
  description = "Content of the policy to be created"
  default     = <<EOT
path "developers/*"
{
  capabilities = ["list"]
}

path "developers/data/user"
{
  capabilities = ["create", "read", "update", "delete", "list"]
}
EOT
}

variable "operation_policy_code" {
  description = "Content of the policy to be created"
  default     = <<EOT
path "operations/*"
{
  capabilities = ["create", "read", "update", "delete", "list"]
}
EOT
}