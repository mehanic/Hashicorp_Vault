resource "vault_policy" "acl" {
  name = var.policy # policy name
  # policy construct
  policy = data.vault_policy_document.policy_documents.hcl

}