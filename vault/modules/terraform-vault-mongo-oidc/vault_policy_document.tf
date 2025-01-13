data "vault_policy_document" "mongodb_user_policy" {
  rule {
    description  = "Read system health check"
    path         = "mongodb/creds/my-role"
    capabilities = ["read"]
  }
}
