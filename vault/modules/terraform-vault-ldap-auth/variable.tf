

# Variables for Vault LDAP configuration
variable "path" {
  type    = string
  default = "ldap"
}

variable "jumpcloud_ad_binduid" {
  type = string
  default = "uid=adminuser,ou=Users,o=12345,dc=jumpcloud,dc=com"
}

variable "jumpcloud_ad_bindpass" {
  type = string
  default = "A@dminSecureP@ssw0rd2025!"
}

variable "jumpcloud_ad_orgid" {
  type = string
  default = "abcd1234-efgh-5678-ijkl-9876mnopqrs"

}

variable "jumpcloud_ad_cert_filename" {
  type    = string
  default = "jumpcloud.chain.pem"
}

variable "jumpcloud_group_policy" {
  type = map(object({
    policies   : list(string)
    identities : map(object({
      disabled : bool
    }))
  }))
  
  default = {
    __test_Engineering = {
      policies = ["__test_vault-ops", "__test_vault-identity-mgmt"]
      identities = {
        __test_ops = { disabled = false }
      }
    }
    __test_QA = {
      policies = ["__test_vault-qa"]
      identities = {
        __test_qa = { disabled = true }
      }
    }

    admin-group = {
      policies   = ["admin", "ops"]
      identities = {
        user1 = { disabled = false }  # Add missing attribute
        user2 = { disabled = false }  # Add missing attribute
      }
    }
  }
}


resource "vault_policy" "vault-ops" {
  name   = "${local.test_prefix}/vault-ops"
  policy = var.vault_ops_policy_content
}

resource "vault_policy" "vault-id-mgmt" {
  name   = "${local.test_prefix}/vault-identity-mgmt"
  policy = var.vault-identity-mgmt_policy_content
}

resource "vault_policy" "vault-qa" {
  name   = "${local.test_prefix}/vault-qa"
  policy = var.vault-qa-policy
}

variable "vault-qa-policy" {
  type        = string
  default     = <<EOT
# Read system health check
path "sys/health" {
  capabilities = ["read", "sudo"]
}

# List existing policies
path "sys/policies/acl" {
  capabilities = ["list"]
}

# Create and manage ACL policies
path "sys/policies/acl/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# List members
path "sys/ha-status" {
  capabilities = ["read"]
}

path "sys/storage/raft/configuration" {
  capabilities = ["read"]
}

path "sys/key-status" {
  capabilities = ["read"]
}

path "sys/internal/counters/activity/monthly" {
  capabilities = ["read"]
}

path "operator" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Enable and manage authentication methods broadly across Vault

# Manage auth methods broadly across Vault
path "auth/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Create, update, and delete auth methods
path "sys/auth/*" {
  capabilities = ["read", "create", "update", "delete", "sudo"]
}

# List auth methods
path "sys/auth" {
  capabilities = ["read"]
}

# Enable and manage the key/value secrets engine at `secret/` path

# List, create, update, and delete key/value secrets
path "secret*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# List, create, update, and delete key/value secrets for consul
path "kv*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# List, create, update, and delete key/value secrets for consul
path "pki/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
path "pki/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Manage secrets engines
path "sys/mounts/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# List existing secrets engines.
path "sys/mounts" {
  capabilities = ["read"]
}

# Manage Nomad config
path "nomad/config/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "nomad/*" {
  capabilities = ["read"]
}

EOT
}


variable "vault-identity-mgmt_policy_content" {
  type        = string
  description = "The policy content for the vault-identity-mgmt policy"
  default = <<EOT
path "identity/*" {
  capabilities = [ "create", "read", "update", "delete", "list" ]
}

# To enable userpass auth method
path "sys/auth/*" {
  capabilities = [ "create", "read", "update", "delete" ]
}

# To create a new user, "end-user" for userpass
path "auth/*" {
  capabilities = [ "create", "read", "update", "delete", "list" ]
}
EOT
}


# Define the variable for vault-ops-policy content
variable "vault_ops_policy_content" {
  type        = string
  description = "The policy content for the vault-ops policy"
  default = <<EOT
# Read system health check
path "sys/health" {
  capabilities = ["read", "sudo"]
}

# Create and manage ACL policies broadly across Vault
path "sys/capabilities" {
  capabilities = ["create"]
}
path "sys/capabilities-self" {
  capabilities = ["create"]
}

# List existing policies
path "sys/policies/acl" {
  capabilities = ["list"]
}

# Create and manage ACL policies
path "sys/policies/acl/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# List members
path "sys/ha-status" {
  capabilities = ["read"]
}

path "sys/storage/raft/configuration" {
  capabilities = ["read"]
}

path "sys/key-status" {
  capabilities = ["read"]
}

path "sys/internal/counters/activity/monthly" {
  capabilities = ["read"]
}

path "operator" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Enable and manage authentication methods broadly across Vault
path "auth/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Create, update, and delete auth methods
path "sys/auth/*" {
  capabilities = ["read", "create", "update", "delete", "sudo"]
}

# List auth methods
path "sys/auth" {
  capabilities = ["read"]
}

# Enable and manage the key/value secrets engine at `secret/` path
path "secret*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# List, create, update, and delete key/value secrets for consul
path "kv*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# List, create, update, and delete key/value secrets for pki
path "pki/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Manage secrets engines
path "sys/mounts/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# List existing secrets engines.
path "sys/mounts" {
  capabilities = ["read"]
}

# Manage Nomad config
path "nomad/config/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "nomad/*" {
  capabilities = ["read"]
}
EOT
}

////

variable "ldap_backend_path" {
  description = "Path to mount the LDAP secrets engine."
  type        = string
  default     = "my-custom-ldap"
}

variable "ldap_binddn" {
  description = "Bind DN for performing user and group searches."
  type        = string
  default     = "CN=Administrator,CN=Users,DC=corp,DC=example,DC=net"
}

variable "ldap_bindpass" {
  description = "Password for the bind DN."
  type        = string
  default     = "SuperSecretPassw0rd"
}

variable "ldap_url" {
  description = "LDAP URL to connect to."
  type        = string
  default     = "ldaps://localhost"
}

variable "ldap_insecure_tls" {
  description = "Skip LDAP server SSL Certificate verification."
  type        = bool
  default     = true
}

variable "ldap_userdn" {
  description = "User DN for LDAP."
  type        = string
  default     = "CN=Users,DC=corp,DC=example,DC=net"
}

variable "ldap_certificate" {
  description = "CA certificate for LDAP server."
  type        = string
  default     = ""
}

variable "ldap_connection_timeout" {
  description = "Timeout for LDAP connection in seconds."
  type        = number
  default     = 30
}

variable "ldap_client_tls_cert" {
  description = "Client TLS certificate for LDAP."
  type        = string
  default     = ""
}

variable "ldap_client_tls_key" {
  description = "Client TLS key for LDAP."
  type        = string
  default     = ""
}

variable "ldap_default_lease_ttl_seconds" {
  description = "Default lease TTL for secrets."
  type        = number
  default     = 0
}

variable "ldap_description" {
  description = "Description for the LDAP mount."
  type        = string
  default     = "LDAP backend for managing credentials"
}

variable "ldap_local" {
  description = "Whether the secrets engine is local-only."
  type        = bool
  default     = false
}

variable "ldap_max_lease_ttl_seconds" {
  description = "Max lease TTL for secrets."
  type        = number
  default     = 0
}

variable "ldap_password_policy" {
  description = "Password policy for generating passwords."
  type        = string
  default     = ""
}

variable "ldap_request_timeout" {
  description = "Timeout for LDAP requests in seconds."
  type        = number
  default     = 30
}

variable "ldap_starttls" {
  description = "Whether to use StartTLS."
  type        = bool
  default     = false
}

variable "ldap_schema" {
  description = "LDAP schema to use."
  type        = string
  default     = "openldap"
}

variable "ldap_upndomain" {
  description = "User principal domain for UPN logins."
  type        = string
  default     = ""
}

variable "ldap_userattr" {
  description = "User attribute for LDAP searches."
  type        = string
  default     = "cn"
}

variable "ldap_skip_static_role_import_rotation" {
  description = "Skip static role import rotation."
  type        = bool
  default     = false
}
