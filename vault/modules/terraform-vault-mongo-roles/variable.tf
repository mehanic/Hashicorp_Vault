variable "mongodb_roles" {
  type = map(object({
    grants      = list(string),
    databases   = optional(list(string)),
    collections = optional(list(string))
  }))
  description = "Roles for MongoDB integration with Vault"
  default = {
    read_role = {
      grants      = ["read"],
      databases   = ["test_db"],
      collections = ["test_collection"]
    },
    write_role = {
      grants      = ["readWrite"],
      databases   = ["test_db"],
      collections = ["test_collection"]
    }
  }
}



variable "database_name" {
  type        = string
  description = "Logical name of the database"
  default     = "mongodb"
}


# MongoDB Username
variable "mongodb_username" {
  description = "The MongoDB username"
  type        = string
  default     = "MongoUser" # Example default value
}

# MongoDB Password
variable "mongodb_password" {
  description = "The MongoDB password"
  type        = string
  default     = "User123" # Example default value
}

# MongoDB Host
variable "mongodb_host" {
  description = "The MongoDB host address"
  type        = string
  default     = "127.0.0.1" # Example default value
}

# MongoDB Port
variable "mongodb_port" {
  description = "The MongoDB port"
  type        = number
  default     = 27017 # Default MongoDB port
}

# MongoDB Database Name
variable "mongodb_db_name" {
  description = "The MongoDB database name"
  type        = string
  default     = "admin" # Example default value
}

variable "path" {
  description = "Path to create the database secrets engine for the integration"
  type        = string
  default     = "mongodb" # Example default value
}

variable "description" {
  description = "Description of the database secrets engine in Vault"
  type        = string
  default     = "" # Optional default
}

variable "default_lease_ttl_seconds" {
  description = "The default lease duration in seconds"
  type        = number
  default     = 3600 # 1 hour as default
}

variable "max_lease_ttl_seconds" {
  description = "The maximum lease duration in seconds"
  type        = number
  default     = 86400 # 24 hours as default
}
