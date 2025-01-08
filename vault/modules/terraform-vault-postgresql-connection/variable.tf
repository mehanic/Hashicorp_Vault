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

variable "db_username" {
  description = "Database user with privileges"
  default     = "postgres"
}

variable "db_password" {
  description = "Password for the database user"
  default     = "new_password" # Replace with a secret management approach in production
}

variable "ssl_mode" {
  description = "SSL mode for the PostgreSQL connection"
  default     = "disable"
}

# postgres=# SELECT rolname FROM pg_roles WHERE rolname = 'vault-one';
#   rolname  
# -----------
#  vault-one
# (1 row)

variable "role_name_prefix" {
  description = "Name of the PostgreSQL role"
  default     = "vault"
}

variable "role_login" {
  description = "Defines whether the role can log in"
  default     = true
}

variable "role_password" {
  description = "Password for the role. Leave blank to generate a random password"
  default     = ""
}

variable "role_superuser" {
  description = "Defines whether the role is a superuser"
  default     = false
}

variable "role_create_database" {
  description = "Defines whether the role can create databases"
  default     = false
}

variable "role_create_role" {
  description = "Defines whether the role can create roles"
  default     = true
}

variable "role_inherit" {
  description = "Defines whether the role inherits privileges"
  default     = true
}

variable "role_replication" {
  description = "Defines whether the role can initiate replication"
  default     = false
}

variable "role_bypass_row_level_security" {
  description = "Defines whether the role bypasses row-level security"
  default     = false
}

variable "role_connection_limit" {
  description = "Defines the connection limit for the role"
  default     = -1
}

variable "role_encrypted_password" {
  description = "Defines whether the password is stored encrypted"
  default     = true
}

variable "role_roles" {
  description = "List of roles to be granted to this role"
  type        = list(string)
  default     = [] // roles = [  "postgres" ]
}

variable "role_search_path" {
  description = "Defines the search path for the role"
  default     = []
}

variable "role_valid_until" {
  description = "Expiration date for the role's password"
  default     = "infinity"
}

variable "role_skip_drop_role" {
  description = "Skip role ownership cleanup on role drop"
  default     = false
}

variable "role_skip_reassign_owned" {
  description = "Skip reassignment of owned objects on role drop"
  default     = true
}

variable "role_statement_timeout" {
  description = "Timeout for statements executed by this role"
  default     = "0" # No timeout by default
}

variable "role_assume_role" {
  description = "Role to assume at login"
  default     = null
}

# Vault Database Secret Backend Configuration

variable "database_name" {
  description = "The name of the database in Vault"
  type        = string
  default     = "vault-postgres-one"
}

variable "allowed_roles" {
  description = "List of allowed roles that can use this connection"
  type        = list(string)
  default     = ["dev", "prod"]
}

variable "max_open_connections" {
  description = "The maximum number of open connections"
  type        = number
  default     = 10
}

variable "max_idle_connections" {
  description = "The maximum number of idle connections"
  type        = number
  default     = 5
}

variable "max_connection_lifetime" {
  description = "The maximum connection lifetime in seconds"
  type        = number
  default     = 3600
}

variable "backend" {
  description = "Backend path for Vault's database secrets engine"
  default     = "postgresql-database"
}

variable "verify_connection" {
  description = "Whether to verify the database connection"
  default     = true
}

variable "login_name_suffix" {
  description = "Suffix for database login names"
  default     = ""
}

variable "database" {
  default = "bwago_development"
}