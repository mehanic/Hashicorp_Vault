resource "vault_database_secret_backend_role" "postgres_service_write" {
  backend = vault_mount.database.path
  name    = "service-write"
  db_name = vault_database_secret_backend_connection.postgres.name

  creation_statements = [
    "CREATE ROLE \"{{name}}\" WITH LOGIN PASSWORD '{{password}}';",
    "GRANT SELECT,INSERT,UPDATE,DELETE ON ALL TABLES IN SCHEMA public TO \"{{name}}\";",
  ]


  revocation_statements = [
    "REVOKE ALL ON ALL TABLES IN SCHEMA public FROM \"{{name}}\";",
    "DROP ROLE \"{{name}}\";",
  ]

  default_ttl = 864000 // 10 days
  max_ttl     = 864000 // 10 days
}

resource "vault_database_secret_backend_role" "postgres_dev_read" {
  backend = vault_mount.database.path
  name    = "dev-read"
  db_name = vault_database_secret_backend_connection.postgres.name

  creation_statements = [
    "CREATE ROLE \"{{name}}\" WITH LOGIN PASSWORD '{{password}}';",
    "GRANT SELECT ON ALL TABLES IN SCHEMA public TO \"{{name}}\";",
  ]


  revocation_statements = [
    "REVOKE ALL ON ALL TABLES IN SCHEMA public FROM \"{{name}}\";",
    "DROP ROLE \"{{name}}\";",
  ]


  default_ttl = 2592000 // 30 days
  max_ttl     = 2592000 // 30 days
}

