resource "vault_policy" "this" {
  name   = var.owner
  policy = data.vault_policy_document.this.hcl
}
