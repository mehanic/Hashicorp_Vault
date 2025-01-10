
variable "port" {
  default = 3306
}

variable "database" {
  default = "mysql"
}

variable "backend" {
  default = "mysql-static"
}

variable "server_ca" {
  default = null
}

variable "verify_connection" {
  default = true
}

variable "allowed_roles" {
  type    = list(string)
  default = null
}

variable "user_name_prefix" {
  default = "vault"
}

variable "login_name_suffix" {
  default = ""
}

variable "skip_reassign_owned" {
  default = true
}

variable "name" {
  default = "root"
}

variable "host" {
  default = "127.0.0.1"
}

variable "password" {
  default = "1111"
}

variable "username" {
  type        = string
  default     = "root"
  description = "description"
}

variable "grants" {
  type = map(list(string))
  default = {
    "*" = ["SELECT", "INSERT", "UPDATE", "DELETE", "CREATE", "DROP", "RELOAD", "PROCESS", "REFERENCES", "INDEX", "ALTER", "SHOW DATABASES", "CREATE TEMPORARY TABLES", "LOCK TABLES", "EXECUTE", "REPLICATION SLAVE", "REPLICATION CLIENT", "CREATE VIEW", "SHOW VIEW", "CREATE ROUTINE", "ALTER ROUTINE", "CREATE USER", "EVENT", "TRIGGER"]
  }
}