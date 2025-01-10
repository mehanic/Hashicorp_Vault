module "terraform-vault-generic-endpoint-token" {
  source                    = "../../modules/terraform-vault-generic-endpoint-token"
  vault_mount_postgres_path = "postgres"

  database_connection_name = "my-postgres-server"

  database_username = "postgres"

  database_password = "new_password"

  database_addresses = ["127.0.0.1"]

  database_port = 5432

  database_name = "bwago_development"

  database_sslmode = "prefer"

  database_roles = [
    {
      name = "superuser"
      creation_statements = [
        "CREATE ROLE \"{{name}}\" WITH LOGIN PASSWORD '{{password}}' VALID UNTIL '{{expiration}}'; GRANT superuser TO \"{{name}}\"; GRANT ALL PRIVILEGES ON DATABASE postgres TO \"{{name}}\";"
      ]
    }
  ]

}