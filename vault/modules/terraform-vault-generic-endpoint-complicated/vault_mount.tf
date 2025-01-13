resource "vault_mount" "database" {
  path        = "project-777999-database"
  type        = "database"
  description = "Database secrets engine for project 777999"
}
