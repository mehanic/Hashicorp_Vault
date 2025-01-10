output "credential_paths" {
  value = [for role in vault_database_secret_backend_role.this : "${role.backend}/creds/${role.name}"]
}

output "token" {
  value     = vault_token.this.client_token
  sensitive = true
}

output "vault_database_secret_backend_connection" {
  description = "Details of the Vault database secret backend connection."
  value = {
    backend       = vault_database_secret_backend_connection.this.backend
    name          = vault_database_secret_backend_connection.this.name
    allowed_roles = vault_database_secret_backend_connection.this.allowed_roles
  }
}
output "vault_database_secret_backend_role" {
  description = "List of Vault database secret backend roles."
  value = {
    for role_key, role_value in vault_database_secret_backend_role.this :
    role_key => {
      name                = role_value.name
      creation_statements = role_value.creation_statements
      backend             = role_value.backend
    }
  }
}

output "vault_policies" {
  description = "List of Vault policies created for the database roles."
  value = {
    for policy_key, policy_value in vault_policy.this :
    policy_key => {
      name   = policy_value.name
      policy = policy_value.policy
    }
  }
}

output "vault_token" {
  description = "Vault token for service account with associated policies."
  value = {
    id        = vault_token.this.id
    policies  = vault_token.this.policies
    metadata  = vault_token.this.metadata
    renewable = vault_token.this.renewable
    ttl       = vault_token.this.ttl
  }
}
