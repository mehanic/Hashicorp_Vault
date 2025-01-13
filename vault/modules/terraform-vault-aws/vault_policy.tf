resource "vault_policy" "policy" {
  name   = "${var.name}-policy"
  policy = data.vault_policy_document.policy_doc.hcl
}
