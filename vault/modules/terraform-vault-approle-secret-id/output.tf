output "vault_role_name_map" {
  value = try(
    { for name, resource in vault_approle_auth_backend_role.approle_role : name => resource.role_name },
    {}
  )
  description = "The name of the Vault Role created, keyed by the backend name"
}

output "approle_accessor_map" {
  value = try(
    { for name, resource in vault_approle_auth_backend_role_secret_id.approle_secret : name => resource.accessor },
    {}
  )
  description = "ID for approle logins, keyed by the backend name"
}

output "approle_wrapping_accessor" {
  value = try(
    { for name, resource in vault_approle_auth_backend_role_secret_id.approle_secret : name => resource.wrapping_accessor },
    {}
  )
  sensitive   = true
  description = "The unique ID for the response-wrapped SecretID that can be safely logged, keyed by the backend name."
}

output "approle_wrapping_token" {
  value = try(
    { for name, resource in vault_approle_auth_backend_role_secret_id.approle_secret : name => resource.wrapping_token },
    {}
  )
  sensitive   = true
  description = "The token used to retrieve a response-wrapped SecretID, keyed by the backend name."
}

output "approle_role_id" {
  value = try(
    { for name, resource in vault_approle_auth_backend_role.approle_role : name => resource.role_id },
    {}
  )
  description = "ID of the approle created. This ID is auto-generated, and is keyed by the backend name"
}


output "generated_rules" {
  description = "The flattened rules generated based on the named rules provided"
  value       = local.generated_rules
}

output "audit_reader_rule" {
  description = "Audit reader rule details"
  value = {
    for rule in local.named_rules["audit_reader"] :
    rule.path => {
      capabilities = rule.capabilities
      description  = rule.description
    }
  }
}

output "audit_manager_rule" {
  description = "Audit manager rule details"
  value = {
    for rule in local.named_rules["audit_manager"] :
    rule.path => {
      capabilities = rule.capabilities
      description  = rule.description
    }
  }
}
