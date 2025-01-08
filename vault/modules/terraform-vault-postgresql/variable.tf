variable "db" {
  default = "postgres-vault-database"
}

variable "db_endpoint" {
  default     = "database:5432"
  description = "DB endpoint from Vault server point of view. Using compose DNS entry"
}

variable "db_password" {
  default = "123"
}

variable "db_user" {
  default = "Dublin"
}

