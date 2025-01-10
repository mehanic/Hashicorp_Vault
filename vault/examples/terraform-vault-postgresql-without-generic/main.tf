module "terraform-vault-postgresql-without-generic" {
  source = "../../modules/terraform-vault-postgresql-without-generic"
  services = {
    example_service = {
      id                    = "1"
      name                  = "example-service"
      kind                  = "example-kind"
      address               = "127.0.0.1"
      port                  = 5432
      meta                  = {}
      tags                  = []
      namespace             = "default"
      status                = "running"
      node                  = "example-node"
      node_id               = "node-1"
      node_address          = "127.0.0.1"
      node_datacenter       = "dc1"
      node_tagged_addresses = {}
      node_meta             = {}
      cts_user_defined_meta = {}
    }
  }

  name                                   = "postgres-connection"
  postgres_username                      = "postgres"
  postgres_password                      = "new_password"
  postgres_database_name                 = "bwago_development"
  role_name                              = ""
  database_path                          = "database"
  additional_connection_string_arguments = "sslmode=disable"
  allowed_roles                          = ["*"]
  creation_statements = [
    "CREATE ROLE \"{{name}}\" WITH LOGIN PASSWORD '{{password}}' VALID UNTIL '{{expiration}}'; GRANT SELECT ON ALL TABLES IN SCHEMA public TO \"{{name}}\";"
  ]
  revocation_statements            = ["ALTER ROLE \"{{name}}\" NOLOGIN;"]
  default_ttl                      = 3600
  max_ttl                          = 3600
  vault_kubernetes_auth_path       = ""
  bound_service_account_names      = []
  bound_service_account_namespaces = []
}