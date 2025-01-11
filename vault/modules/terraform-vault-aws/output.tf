
output "vault_policy_name" {
  description = "The name of the generated Vault policy"
  value       = vault_policy.policy.name
}

output "aws_auth_backend_roles" {
  description = "The roles created in the AWS Auth Backend"
  value = {
    for key, role in vault_aws_auth_backend_role.role :
    key => {
      backend                  = role.backend
      role                     = role.role
      bound_iam_principal_arns = role.bound_iam_principal_arns
      token_policies           = role.token_policies
      token_ttl                = role.token_ttl
      token_max_ttl            = role.token_max_ttl
    }
  }
}

output "generated_rules" {
  description = "The flattened rules generated based on the named and provided rules"
  value       = local.generated_rules
}
