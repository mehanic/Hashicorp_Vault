resource "vault_auth_backend" "approle" {
  type        = "approle"
  path        = var.backend_paths["approle"]
  description = "AppRole Authentication Backend"
}


resource "vault_approle_auth_backend_role" "approle_role" {
  for_each = var.enable_approle_login ? var.backend_paths : {}

  backend        = each.key
  role_name      = each.value
  bind_secret_id = true

  token_policies = [vault_policy.policy.name]
  token_ttl      = var.token_ttl
  token_max_ttl  = var.token_max_ttl
}

resource "vault_approle_auth_backend_role_secret_id" "approle_secret" {
  for_each = vault_approle_auth_backend_role.approle_role

  backend      = each.value.backend
  role_name    = each.value.role_name
  wrapping_ttl = var.wrapping_ttl
}

resource "vault_policy" "policy" {
  name   = "${var.name}-policy"
  policy = data.vault_policy_document.policy_doc.hcl
}

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
