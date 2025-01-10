variable "mysql_host" {
  description = "Hostname or IP address of the MySQL server"
  type        = string
  default     = "127.0.0.1"
}


variable "port" {
  description = "Hostname or IP address of the MySQL server"
  type        = string
  default     = "3306"
}

variable "mysql_username" {
  description = "Username for the MySQL admin user"
  type        = string
  default     = ""
}

variable "mysql_password" {
  description = "Password for the MySQL admin user"
  type        = string
  sensitive   = true
  default     = ""
}

variable "allowed_roles" {
  description = "List of roles allowed to use the connection"
  type        = list(string)
  default     = ["*"]
}

variable "db_roles" {
  description = "Database roles with configuration for TTLs and privileges"
  type = list(object({
    rolename     = string
    privileges   = string
    default_ttl  = number
    max_ttl      = number
  }))
  default = [
    {
      rolename     = "application_dba"
      privileges   = "ALL PRIVILEGES ON application.*"
      default_ttl  = 300
      max_ttl      = 3000
    },
    {
      rolename     = "customer_analytics"
      privileges   = "SELECT ON customer.*"
      default_ttl  = 60
      max_ttl      = 600
    },
    {
      rolename     = "customer_dba"
      privileges   = "ALL PRIVILEGES ON customer.*"
      default_ttl  = 300
      max_ttl      = 3000
    }
  ]
}
