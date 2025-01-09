module "terraform-vault-postgresql-roles" {
  source = "../../modules/terraform-vault-postgresql-roles"
  # Path to create the database secrets engine for the integration
  path = "postgresql"

  # Description of the database secrets engine in Vault
  description = "PostgreSQL database integration for Vault"

  # Default lease duration in seconds (1 hour)
  default_lease_ttl_seconds = 3600

  # Maximum lease duration in seconds (24 hours)
  max_lease_ttl_seconds = 86400

  # Backend type (postgresql-database)
  backend = "postgresql"

  # The logical name of the database
  database_name = "mydatabase"

  # Database user with privileges
  db_username = "postgres"

  # Password for the database user
  db_password = "new_password"

  # Database host address
  db_host = "127.0.0.1"

  # Database port
  db_port = 5432

  # Database name
  db_name = "postgres"

  # SSL mode for the PostgreSQL connection
  ssl_mode = "disable"

  # PostgreSQL roles with grants, schemas, and tables
  postgresql_roles = {
    dev = {
      grants  = ["SELECT", "INSERT"],
      schemas = ["public"],
      tables  = ["table1", "table2"]
    },
    prod = {
      grants  = ["SELECT"],
      schemas = ["public"],
      tables  = ["table3"]
    },
    qa = {
      grants  = ["SELECT"],
      schemas = ["public"],
      tables  = ["table4"]
    }
  }

  # Maximum connection lifetime in seconds (1 hour)
  max_connection_lifetime = 3600

  # Maximum number of idle connections
  max_idle_connections = 5

  # Maximum number of open connections
  max_open_connections = 10


}
