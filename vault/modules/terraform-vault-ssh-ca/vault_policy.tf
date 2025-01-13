resource "vault_policy" "allow_ca" {
  name   = var.ssh_policy_name
  policy = data.vault_policy_document.allow_ca.hcl
}

resource "vault_policy" "allow_changing_password" {
  name   = var.userpass_policy_name
  policy = data.vault_policy_document.allow_changing_password.hcl
}