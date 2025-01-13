resource "vault_policy" "default" {
  name   = "aws-creds-tmpl"
  policy = data.vault_policy_document.default.hcl
}
