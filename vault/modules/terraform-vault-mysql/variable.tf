variable "roles" {
  type        = any
  description = "Roles"
  default =  [
    {
      role_name : "role-db-1"
      database_name : "db-1"
      quota : {
        max_leases : 10
      }
      creation_statements = [
        "CREATE USER '{{name}}'@'%' IDENTIFIED BY '{{password}}';",
        "GRANT SELECT, UPDATE, INSERT, DELETE, ALTER, CREATE, DROP, ALTER, INDEX ON `db-1`.* TO '{{name}}'@'%';"
      ],
      default_ttl = "4m"
      max_ttl     = "10m"
      quota = {
        rate : 10
        interval : 10
        block_interval : 10
      }
    },
    {
      role_name : "role-db-2"
      database_name : "db-2"
      quota = {
        max_leases : 10
      }
      creation_statements = [
        "CREATE USER '{{name}}'@'%' IDENTIFIED BY '{{password}}';",
        "GRANT SELECT, UPDATE, INSERT, DELETE, ALTER, CREATE, DROP, ALTER, INDEX ON `db-2`.* TO '{{name}}'@'%';"
      ],
      default_ttl = "4m"
      max_ttl     = "10m"
      quota : {
        rate : 10
        interval : 10
        block_interval : 10
      }
    },
  ]
}

variable "connection_name" {
  default     = "mysql"
  type        = string
  description = "Connection name"
}

variable "allowed_roles" {
  default     = []
  type        = list(string)
  description = "Allowed roles"
}

# db
variable "db_url" {
  type        = string
  description = "A URL containing connection information. See the Vault docs for an example."
  default = "127.0.0.1:3306"
}

variable "db_username" {
  type        = string
  description = "The database VAULT ADMIN username to authenticate with"
  default = "root"
}

variable "db_password" {
  type        = string
  description = "The database VAULT ADMIN password to authenticate with"
  default = "new_password"

}

variable "username_prefix" {
  type        = string
  default     = "v-"
  description = "Prefix for user created in database"
}

variable "username_template" {
  default     = "{{.RoleName}}-{{(random 8)}}"
  type        = string
  description = "For Vault v1.7+. The template to use for username generation. See the Vault docs"
}

variable "tls_ca" {
  default     = ""
  type        = string
  description = "x509 CA file for validating the certificate presented by the MySQL server. Must be PEM encoded."
}

variable "tls_certificate_key" {
  default     = ""
  type        = string
  description = "x509 certificate for connecting to the database. This must be a PEM encoded version of the private key and the certificate combined"
}

variable "max_connection_lifetime" {
  default     = null
  type        = number
  description = "The maximum number of seconds to keep a connection alive for."
}

variable "max_idle_connections" {
  default     = null
  type        = number
  description = "The maximum number of idle connections to maintain."
}

variable "max_open_connections" {
  default     = null
  type        = number
  description = "The maximum number of open connections to use."
}

variable "vault_namespace" {
  default     = "root"
  type        = string
  description = "Vault Namespace"
}

variable "vault_mount_path" {
  default     = "database"
  type        = string
  description = "Database secret engine mount path"
}

variable "existing_engine" {
  default     = false
  type        = bool
  description = "Existing Database Secret Engine"
}

variable "token_display_name" {
  default     = "dynamic-engine-vending-admin"
  type        = string
  description = "Vault Token display name"
}

variable "lease_count_enabled" {
  default     = false
  type        = bool
  description = "ENTERPRISE ONLY! Manage lease count quotas which enforce the number of leases that can be created. \nA lease count quota can be created at the root level or defined on a namespace or mount by specifying a path when creating the quota"
}

variable "default_creation_statements" {
  default = [
    "CREATE USER '{{name}}'@'%' IDENTIFIED BY '{{password}}';",
    "GRANT SELECT ON *.* TO '{{name}}'@'%';"
  ]
  type        = list(string)
  description = "SQL Statements to be executed for creation"
}

variable "default_revocation_statements" {
  default     = null
  type        = list(string)
  description = "SQL Statements to be executed for revocation"
}

variable "default_renew_statements" {
  default     = null
  type        = list(string)
  description = "SQL Statements to be executed for renew"
}

variable "default_rollback_statements" {
  default     = null
  type        = list(string)
  description = "SQL Statements to be executed for rollback"
}

variable "default_ttl" {
  default     = 240
  type        = number
  description = "Vault Namespace"
}

variable "default_max_ttl" {
  default     = "600"
  type        = number
  description = "Vault Namespace"
}


variable "default_max_leases" {
  default     = "100"
  type        = number
  description = "The maximum number of leases to be allowed by the quota rule. The max_leases must be positive."
}

variable "default_rate_limit_rate" {
  default     = "10"
  type        = number
  description = "The maximum number of requests at any given second to be allowed by the quota rule. The rate must be positive."
}

variable "default_rate_limit_interval" {
  default     = "1"
  type        = number
  description = "The duration in seconds to enforce rate limiting for"
}

variable "default_rate_limit_block_interval" {
  default     = "10"
  type        = number
  description = "If set, when a client reaches a rate limit threshold, the client will be prohibited from any further requests until after the 'block_interval' in seconds has elapsed."
}
