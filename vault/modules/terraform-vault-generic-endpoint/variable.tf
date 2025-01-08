variable "db_hostname" {
  description = "The hostname to connect to."
  type        = string
  default     = "127.0.0.1"
}

variable "db_username" {
  description = "The username to use to connect to the database."
  type        = string
  default     = "postgres"
}
variable "db_password" {
  description = "The password to use to connect to the database."
  type        = string
  default     = "new_password"
}

variable "db_tcp_port" {
  description = "The TCP port to use to connect to postgres."
  type        = number
  default     = 5432
  validation {
    condition     = var.db_tcp_port > 0 && var.db_tcp_port < 65536
    error_message = "Please choose a valid TCP port between 1 and 65535."
  }
}

variable "db_path" {
  description = "The path to mount the database backend."
  type        = string
  default     = "vault_database_postgresql"

}

variable "db_backend_role_name" {
  description = "The name of the role to create."
  type        = string
  default     = "dev"
}

variable "db_backend_connection_name" {
  description = "The name of the connection to create."
  type        = string
  default     = "postgres"
}