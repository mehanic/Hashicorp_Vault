variable "services" {
  description = "Consul services monitored by Consul-Terraform-Sync"
  type = map(
    object({
      id        = string
      name      = string
      kind      = string
      address   = string
      port      = number
      meta      = map(string)
      tags      = list(string)
      namespace = string
      status    = string

      node                  = string
      node_id               = string
      node_address          = string
      node_datacenter       = string
      node_tagged_addresses = map(string)
      node_meta             = map(string)

      cts_user_defined_meta = map(string)
    })
  )

  default = {
    example_service = {
      id                    = "1"
      name                  = "example-service"
      kind                  = "example-kind"
      address               = "127.0.0.1"
      port                  = 5432
      meta                  = {}
      tags                  = []
      namespace             = "default"
      status                = "running"
      node                  = "example-node"
      node_id               = "node-1"
      node_address          = "127.0.0.1"
      node_datacenter       = "dc1"
      node_tagged_addresses = {}
      node_meta             = {}
      cts_user_defined_meta = {}
    }
  }
}

locals {
  first_element    = keys(var.services).0
  database_address = var.services[local.first_element].address
  database_port    = var.services[local.first_element].port
}

## Required variables for module

variable "name" {
  type        = string
  description = "Name of database connection and role to configure in Vault"
  default     = "postgres-connection"
}

variable "postgres_username" {
  type        = string
  description = "Administrative username for PostgreSQL"
  default     = "postgres"
}

variable "postgres_password" {
  type        = string
  description = "Administrative password for PostgreSQL"
  sensitive   = true
  default     = "new_password"
}

variable "postgres_database_name" {
  type        = string
  description = "Database to access for PostgreSQL"
  default     = "bwago_development"
}

## Optional variables for module

variable "role_name" {
  type        = string
  description = "Name of role to configure in Vault if not the same as database connection."
  default     = ""
}

variable "database_path" {
  type        = string
  description = "Path to database secrets engine in Vault"
  default     = "database"
}

variable "additional_connection_string_arguments" {
  type        = string
  description = "Additional connection string arguments for database connection in Vault"
  default     = "sslmode=disable"
}

variable "allowed_roles" {
  type        = list(string)
  description = "List of allowed roles for database connection in Vault"
  default     = ["*"]
}

variable "creation_statements" {
  type        = list(string)
  description = "List of creation statements to create user in PostgreSQL"
  default     = ["CREATE ROLE \"{{name}}\" WITH LOGIN PASSWORD '{{password}}' VALID UNTIL '{{expiration}}'; GRANT SELECT ON ALL TABLES IN SCHEMA public TO \"{{name}}\";"]
}

variable "revocation_statements" {
  type        = list(string)
  description = "List of revocation statements to create user in PostgreSQL"
  default     = ["ALTER ROLE \"{{name}}\" NOLOGIN;"]
}

variable "default_ttl" {
  type        = number
  description = "Default TTL for database credentials"
  default     = 3600
}

variable "max_ttl" {
  type        = number
  description = "Max TTL for database credentials"
  default     = 3600
}

## Kubernetes auth method

variable "vault_kubernetes_auth_path" {
  type        = string
  description = "If set, set up Kubernetes auth method."
  default     = ""
}

variable "bound_service_account_names" {
  type        = list(string)
  description = "If set, set up Kubernetes auth method with specific service accounts."
  default     = []
}

variable "bound_service_account_namespaces" {
  type        = list(string)
  description = "If set, set up Kubernetes auth method with specific namespaces."
  default     = []
}

locals {
  set_up_kubernetes_auth = var.vault_kubernetes_auth_path != "" && length(var.bound_service_account_names) > 0 && length(var.bound_service_account_namespaces) > 0
}