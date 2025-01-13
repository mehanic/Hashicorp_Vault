resource "vault_token" "this" {
  no_parent = true
  period    = "24h"
  policies = concat([
    for policy in vault_policy.this : policy.name
    ], [
    "revoke_lease"
  ])
  metadata = {
    "purpose" = "service-account"
  }
}