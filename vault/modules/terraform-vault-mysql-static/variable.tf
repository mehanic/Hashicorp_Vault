variable "mysql_host" {
  description = "Hostname or IP of MySQL server"
  type        = string
  default     = "127.0.0.1"
}

variable "mysql_username" {
  description = "Username for MySQL admin user"
  type        = string
  default     = "root"
}

variable "mysql_password" {
  description = "Password for MySQL admin user"
  type        = string
  sensitive   = true
  default     = "new_password"
}

variable "allowed_roles" {
  description = "List of roles allowed to connect to DB secrets backend"
  type        = list(string)
  default     = ["role1", "role2"]
}

variable "db_name" {
  description = "Name of the database configured in the backend role"
  type        = string
  default     = "test_db"
}
