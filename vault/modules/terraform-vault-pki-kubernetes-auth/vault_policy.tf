resource "vault_policy" "pki-app1" {
  name   = "pki-app1"
  policy = data.vault_policy_document.pki-app1.hcl
}
