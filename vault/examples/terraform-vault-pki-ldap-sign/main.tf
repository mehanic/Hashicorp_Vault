module "terraform-vault-pki-ldap-sign" {
  source = "../../modules/terraform-vault-pki-ldap-sign"

  ldaps_server  = "directory.element.local"
  ldaps_userdn  = "cn=users,dc=element,dc=local"
  ldaps_groupdn = "cn=groups,dc=element,dc=local"
  ldaps_ca_file = "./../modules/terraform-vault-pki-ldap-sign/my_ldap_cert.pem"
  //openssl s_client -showcerts -connect mydc.mycompany.com:636 -servername mydc.mycompany.com </dev/null 2>/dev/null > my_ldaps_cert.pem

  code_sign_user_cn_valid_domain = "element.local"

  # ldaps_server                   = "directory.element.local"
  # ldaps_userdn                   = "cn=users,dc=element,dc=local"
  # ldaps_groupdn                  = "cn=groups,dc=element,dc=local"
  # ldaps_ca_file                  = "ELN_CA.pem"
  # code_sign_user_cn_valid_domain = "element.local"


}