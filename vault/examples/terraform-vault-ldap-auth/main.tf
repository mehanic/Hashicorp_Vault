module "terraform-vault-ldap-auth" {
  source = "../../modules/terraform-vault-ldap-auth"
  # Path for LDAP
  path = "ldap"

  # JumpCloud AD configuration
  jumpcloud_ad_binduid       = "uid=adminuser,ou=Users,o=12345,dc=jumpcloud,dc=com"
  jumpcloud_ad_bindpass      = "A@dminSecureP@ssw0rd2025!"
  jumpcloud_ad_orgid         = "abcd1234-efgh-5678-ijkl-9876mnopqrs"
  jumpcloud_ad_cert_filename = "../../modules/terraform-vault-ldap-auth/tls/jumpcloud.chain.pem"

  # JumpCloud group policy mapping
  jumpcloud_group_policy = {
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
      policies = ["admin", "ops"]
      identities = {
        user1 = { disabled = false }
        user2 = { disabled = false }
      }
    }
  }

  # Vault policy contents
  vault_ops_policy_content = <<EOT
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

# List existing secrets engines
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

  vault-identity-mgmt_policy_content = <<EOT
path "identity/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# Enable userpass auth method
path "sys/auth/*" {
  capabilities = ["create", "read", "update", "delete"]
}

# Manage end-user accounts for userpass auth
path "auth/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}
EOT

  vault-qa-policy = <<EOT
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
path "auth/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Manage auth methods broadly across Vault
path "sys/auth/*" {
  capabilities = ["read", "create", "update", "delete", "sudo"]
}

# List auth methods
path "sys/auth" {
  capabilities = ["read"]
}

# Manage key/value secrets at various paths
path "secret*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "kv*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "pki/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Manage secrets engines
path "sys/mounts/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# List existing secrets engines
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
