
# resource "vault_auth_backend" "aws" {
#   type        = "aws"
#   path        = var.backend_paths["aws"] # Use dynamic path
#   description = "AWS Authentication Backend"
# }

# # Define the AWS Auth Backend Role
# resource "vault_aws_auth_backend_role" "role" {
#   for_each = length(var.login_role_arns) > 0 ? var.backend_paths : {}

#   backend                  = vault_auth_backend.aws.path # Use correct backend path
#   role                     = each.value
#   auth_type                = "iam"
#   bound_iam_principal_arns = var.login_role_arns
#   resolve_aws_unique_ids   = false

#   token_policies = [vault_policy.policy.name]
#   token_ttl      = var.token_ttl
#   token_max_ttl  = var.token_max_ttl
# }


# resource "vault_policy" "policy" {
#   name   = "${var.name}-policy"
#   policy = data.vault_policy_document.policy_doc.hcl
# }

# data "vault_policy_document" "policy_doc" {
#   rule {
#     path         = "secret/*"
#     capabilities = ["create", "read", "update", "delete", "list"]
#   }
# }