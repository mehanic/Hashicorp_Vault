variable "ldaps_server" {
  description = "Hostname of LDAPS server"
  default     = "directory.acme.local"
}

variable "ldaps_userdn" {
  description = "Base DN under which to perform user search"
  default     = "cn=users,dc=acme,dc=local"
}

variable "ldaps_groupdn" {
  description = "Base DN under which to perform group search"
  default     = "cn=groups,dc=acme,dc=local"
}

variable "ldaps_ca_file" {
  description = "CA certificate file for LDAPS server"
  default     = "../../modules/terraform-vault-pki-ldap-sign/my_ldap_cert.pem"
  //openssl s_client -showcerts -connect mydc.mycompany.com:636 -servername mydc.mycompany.com </dev/null 2>/dev/null > my_ldaps_cert.pem

}

variable "code_sign_user_cn_valid_domain" {
  description = "Email domain to validate against CN in code signing certificate requests."
  default     = "acme.local"
}
