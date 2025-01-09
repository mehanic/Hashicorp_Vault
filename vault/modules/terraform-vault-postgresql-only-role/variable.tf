variable "name" {
  type        = string
  default     = "vault-postgresql-only-role"
  description = "description"
}

variable "backend" {
  type        = string
  default     = "postgresql-database" //should exist yet
  description = "description"
}


variable "db_name" {
  type        = string
  default     = "example_db"
  description = "description"
}

variable "creation_statements" {
  type = list(string)
  default = [
    "CREATE USER {{name}} PASSWORD = '{{password}}' DAYS_TO_EXPIRY = {{expiration}};" # Modify as needed
  ]
}

variable "default_ttl" {
  default = 300
}

variable "max_ttl" {
  default = 3600
}