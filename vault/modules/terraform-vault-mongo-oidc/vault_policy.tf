resource "vault_policy" "mongodb_user" {
  name   = "mongodb-user"
  policy = data.vault_policy_document.mongodb_user_policy.hcl
}

