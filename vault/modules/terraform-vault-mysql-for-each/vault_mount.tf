resource "vault_mount" "database" {
  path        = "db"
  type        = "database"
  description = "database secret engine mount"
}
