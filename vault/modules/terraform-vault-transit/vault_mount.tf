resource "vault_mount" "transit" {
  count       = length(var.transit_keys) > 0 ? 1 : 0
  path        = var.transit_path
  type        = "transit"
  description = "Transit secret engine used by occult"
}
