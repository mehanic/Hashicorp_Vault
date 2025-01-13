resource "vault_ldap_auth_backend" "ldap" {
  path         = "ldap"
  url          = "ldaps://${var.ldaps_server}"
  userdn       = var.ldaps_userdn
  userattr     = "uid"
  discoverdn   = false
  groupdn      = var.ldaps_groupdn
  insecure_tls = false
  starttls     = true
  // certificate  = file(var.ldaps_ca_file)
}