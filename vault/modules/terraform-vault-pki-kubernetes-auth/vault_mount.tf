resource "vault_mount" "pki-root" {
  path                      = "pki-root"
  type                      = "pki"
  description               = "root PKI mount"
  default_lease_ttl_seconds = local.default_2y_in_sec
  max_lease_ttl_seconds     = local.default_3y_in_sec
}

resource "vault_mount" "pki-short" {
  path                      = "pki-short"
  type                      = "pki"
  description               = "short PKI mount"
  default_lease_ttl_seconds = local.default_30d_in_sec
  max_lease_ttl_seconds     = local.default_60d_in_sec
}
