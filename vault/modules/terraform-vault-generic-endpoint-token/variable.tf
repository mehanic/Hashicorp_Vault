

variable "vault_mount_postgres_path" {
  type    = string
  default = "postgres"
}
variable "database_connection_name" {
  type    = string
  default = "my-postgres-server"
}
variable "database_username" {
  type    = string
  default = "postgres"
}
variable "database_password" {
  type    = string
  default = "new_password"
}
variable "database_addresses" {
  type    = list(string)
  default = ["127.0.0.1"]
}
variable "database_port" {
  type    = number
  default = 5432
}
variable "database_name" {
  default = "bwago_development"
}
variable "database_sslmode" {
  type    = string
  default = "prefer"
  validation {
    condition = contains([
      "disable",
      "allow",
      "prefer",
      "require",
      "verify-ca",
      "verify-full"
    ], var.database_sslmode)
    error_message = "database_sslmode value should be one of: disable, allow, prefer, require, verify-ca, or verify-full."
  }
}
variable "database_roles" {
  type = list(object({
    name                = string
    creation_statements = list(string)
  }))
  default = [
    {
      name = "superuser"
      creation_statements = [
        "CREATE ROLE \"{{name}}\" WITH LOGIN PASSWORD '{{password}}' VALID UNTIL '{{expiration}}'; GRANT superuser TO \"{{name}}\"; GRANT ALL PRIVILEGES ON DATABASE postgres TO \"{{name}}\";"
      ]
    }
  ]
}