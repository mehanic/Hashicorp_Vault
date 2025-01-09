variable "path" {
  description = "Path to create the database secrets engine for the integration"
  type        = string
  default     = "postgresql" # Example default value
}

variable "description" {
  description = "Description of the database secrets engine in Vault"
  type        = string
  default     = "" # Optional default
}

variable "default_lease_ttl_seconds" {
  description = "The default lease duration in seconds"
  type        = number
  default     = 3600 # 1 hour as default
}

variable "max_lease_ttl_seconds" {
  description = "The maximum lease duration in seconds"
  type        = number
  default     = 86400 # 24 hours as default
}

variable "backend" {
  description = "Backend type (e.g., postgresql-database)"
  type        = string
  default     = "postgresql" # Example default value
}

variable "database_name" {
  description = "The logical name of the database"
  type        = string
  default     = "mydatabase" # Example default value
}

# variable "postgresql_connection_url" {
#   description = "Connection URL to the PostgreSQL database"
#   type        = string
#   default     = "postgres://user:password@localhost:5432/mydatabase"  # Example default value
# }

variable "db_username" {
  description = "Database user with privileges"
  default     = "postgres"
}

variable "db_password" {
  description = "Password for the database user"
  default     = "new_password" # Replace with a secret management approach in production
}

variable "db_host" {
  description = "Database host address"
  default     = "127.0.0.1"
}

variable "db_port" {
  description = "Database port"
  default     = 5432
}

variable "db_name" {
  description = "Database name"
  default     = "postgres"
}

variable "ssl_mode" {
  description = "SSL mode for the PostgreSQL connection"
  default     = "disable"
}

# Define the variable for PostgreSQL roles with grants, schemas, and tables
variable "postgresql_roles" {
  type = map(object({
    grants  = list(string),
    schemas = optional(list(string)),
    tables  = optional(list(string))
  }))
  description = "Database access roles as they should be defined in Vault, given as a map from strings to objects having database names and role names in PostgreSQL."
  default = {
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
}

variable "max_connection_lifetime" {
  description = "Maximum connection lifetime in seconds"
  type        = number
  default     = 3600 # 1 hour as default
}

variable "max_idle_connections" {
  description = "Maximum number of idle connections"
  type        = number
  default     = 5
}

variable "max_open_connections" {
  description = "Maximum number of open connections"
  type        = number
  default     = 10
}
