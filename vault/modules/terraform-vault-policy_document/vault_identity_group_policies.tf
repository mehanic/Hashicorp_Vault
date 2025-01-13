# Assign policies to the identity group
resource "vault_identity_group_policies" "default" {
  group_id  = vault_identity_group.default.id
  exclusive = true
  policies = [
    "default",
    vault_policy.default.name,
  ]
}