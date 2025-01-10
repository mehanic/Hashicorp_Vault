variable "db_username" {
  description = "Username of database admin user"
  type        = string
  default     = "postgres"
}

variable "db_password" {
  description = "Password of database admin user"
  type        = string
  sensitive   = true
  default     = "new_password"
}

variable "db_host" {
  description = "Hostname or IP of database server"
  type        = string
  default     = "127.0.0.1"
}

variable "db_user_static" {
  description = "Username of sttic role database user"
  type        = string
  default     = "postgres"
}