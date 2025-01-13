resource "vault_policy" "postgres" {
  name   = local.role_name
  policy = data.vault_policy_document.postgres.hcl
}
