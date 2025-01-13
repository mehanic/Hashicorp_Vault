resource "vault_ldap_auth_backend" "this" {
  path           = var.path
  url            = "ldaps://ldap.jumpcloud.com"
  certificate    = file(local.jumpcloud_cert)
  binddn         = "uid=${var.jumpcloud_ad_binduid},ou=Users,o=${var.jumpcloud_ad_orgid},dc=jumpcloud,dc=com"
  bindpass       = var.jumpcloud_ad_bindpass
  discoverdn     = false
  userdn         = "ou=Users,o=${var.jumpcloud_ad_orgid},dc=jumpcloud,dc=com"
  userattr       = "uid"
  groupdn        = "ou=Users,o=${var.jumpcloud_ad_orgid},dc=jumpcloud,dc=com"
  groupfilter    = "(member={{.UserDN}})"
  groupattr      = "memberOf"
  insecure_tls   = false
  starttls       = false
  deny_null_bind = true
}
