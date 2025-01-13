data "vault_policy_document" "pki-app1" {
  rule {
    path         = "${vault_mount.pki-short.path}/issue/app1"
    capabilities = ["create", "update"]
    description  = "allow issuing certificates"
  }
}