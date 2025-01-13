data "vault_policy_document" "postgres" {
  rule {
    path         = "${vault_mount.postgres.path}/creds/${vault_database_secret_backend_role.postgres.name}"
    capabilities = ["read"]
    description  = "Allow read access to database credentials at ${vault_mount.postgres.path}"
  }
}