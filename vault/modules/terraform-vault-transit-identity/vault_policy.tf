resource "vault_policy" "encrypt" {
  name   = "transit-encrypt-tmpl"
  policy = data.vault_policy_document.encrypt.hcl
}

resource "vault_policy" "decrypt" {
  name   = "transit-decrypt-tmpl"
  policy = data.vault_policy_document.decrypt.hcl
}
