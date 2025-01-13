
data "vault_policy_document" "policy_doc" {
  rule {
    path         = "secret/*"
    capabilities = ["create", "read", "update", "delete", "list"]
  }
}

/**
 * Create a policy document to determine what access this role has in Vault
 */
# data "vault_policy_document" "policy_doc" {
#   dynamic "rule" {
#     for_each = concat(var.rules, local.generated_rules)
#     content {
#       path         = rule.value.path
#       capabilities = rule.value.capabilities
#       description  = rule.value.description

#       dynamic "allowed_parameter" {
#         for_each = rule.value.allowed_parameters
#         content {
#           key   = allowed_parameter.key
#           value = allowed_parameter.value
#         }
#       }

#       dynamic "denied_parameter" {
#         for_each = rule.value.denied_parameters
#         content {
#           key   = denied_parameter.key
#           value = denied_parameter.value
#         }
#       }
#     }
#   }
# }