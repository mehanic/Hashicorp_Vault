resource "vault_policy" "ldap_code_sign" {
  name = "ldap_code_sign"

  policy = file("../../modules/terraform-vault-pki-ldap-sign/pki_policy.hcl")
}
