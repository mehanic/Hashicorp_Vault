# # Enable AWS Secrets Engine
# resource "vault_aws_secret_backend" "this" {
#   path = var.path # Path where the AWS secrets engine will be enabled
# }

# # Configure AWS Secret Backend Role
# resource "vault_aws_secret_backend_role" "this" {
#   name            = var.name
#   backend         = vault_aws_secret_backend.this.path # Using the backend path where the secrets engine is enabled
#   credential_type = var.credential_type
#   default_sts_ttl = var.default_sts_ttl
#   max_sts_ttl     = var.max_sts_ttl

#   # Ensure at least one of policy_arns, role_arns, or policy_document is set
#   policy_arns     = length(var.policy_arns) > 0 ? var.policy_arns : null
#   role_arns       = length(var.role_arns) > 0 ? var.role_arns : null
#   policy_document = var.policy_document != "" ? var.policy_document : null
# }
