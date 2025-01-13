resource "vault_mount" "database" {
  path                      = "database"
  type                      = "database"
  default_lease_ttl_seconds = local.database["lease_ttl"]
  max_lease_ttl_seconds     = local.database["lease_ttl"]
}
