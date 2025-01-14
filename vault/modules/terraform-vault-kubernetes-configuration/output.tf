# output "this" {
#   value = vault_kubernetes_auth_backend_role.kubernetes_auth_backend_role
# }


# Output the Kubernetes Auth Backend Path
output "kubernetes_auth_backend_path" {
  description = "The path at which the Kubernetes auth backend is mounted."
  value       = vault_auth_backend.kubernetes.path
}

# Output the Kubernetes Auth Backend Role Name
output "kubernetes_auth_backend_role_name" {
  description = "The name of the Kubernetes auth backend role."
  value       = vault_kubernetes_auth_backend_role.kubernetes_auth_backend_role.role_name
}

# Output the Audience for the Kubernetes Auth Backend Role
output "kubernetes_auth_backend_role_audience" {
  description = "The audience for the Kubernetes auth backend role."
  value       = vault_kubernetes_auth_backend_role.kubernetes_auth_backend_role.audience
}

# Output the Bound Service Account Names for the Role
output "kubernetes_auth_backend_role_bound_service_account_names" {
  description = "The list of service account names bound to the Kubernetes auth backend role."
  value       = vault_kubernetes_auth_backend_role.kubernetes_auth_backend_role.bound_service_account_names
}

# Output the Bound Service Account Namespaces for the Role
output "kubernetes_auth_backend_role_bound_service_account_namespaces" {
  description = "The list of namespaces bound to the Kubernetes auth backend role."
  value       = vault_kubernetes_auth_backend_role.kubernetes_auth_backend_role.bound_service_account_namespaces
}

# Output the Token TTL for the Kubernetes Auth Backend Role
output "kubernetes_auth_backend_role_token_ttl" {
  description = "The token TTL for the Kubernetes auth backend role."
  value       = vault_kubernetes_auth_backend_role.kubernetes_auth_backend_role.token_ttl
}

# Output the Token Max TTL for the Kubernetes Auth Backend Role
output "kubernetes_auth_backend_role_token_max_ttl" {
  description = "The token max TTL for the Kubernetes auth backend role."
  value       = vault_kubernetes_auth_backend_role.kubernetes_auth_backend_role.token_max_ttl
}

# Output the Policies applied to the Kubernetes Auth Backend Role
output "kubernetes_auth_backend_role_policies" {
  description = "The list of policies applied to the Kubernetes auth backend role."
  value       = vault_kubernetes_auth_backend_role.kubernetes_auth_backend_role.token_policies
}


# output "kubernetes_auth_backend_path" {
#   description = "The path where the Kubernetes auth backend is mounted."
#   value       = vault_auth_backend.kubernetes.path
# }

output "kubernetes_role_name" {
  description = "The name of the Kubernetes auth backend role created."
  value       = vault_kubernetes_auth_backend_role.kubernetes_auth_backend_role.role_name
}

output "vault_kubernetes_token_ttl" {
  description = "The TTL for tokens issued by the Kubernetes auth backend."
  value       = vault_kubernetes_auth_backend_role.kubernetes_auth_backend_role.token_ttl
}

output "vault_kubernetes_token_max_ttl" {
  description = "The maximum TTL for tokens issued by the Kubernetes auth backend."
  value       = vault_kubernetes_auth_backend_role.kubernetes_auth_backend_role.token_max_ttl
}

output "kubernetes_auth_backend_url" {
  description = "The URL of the Kubernetes API server."
  value       = var.kubernetes_host
}

output "kubernetes_auth_backend_ca_cert" {
  description = "The Kubernetes CA certificate used for verifying the API server."
  value       = var.kubernetes_ca_cert
}

output "vault_kubernetes_token_policies" {
  description = "The list of policies attached to the generated tokens."
  value       = vault_kubernetes_auth_backend_role.kubernetes_auth_backend_role.token_policies
}

output "kubernetes_auth_backend_config" {
  description = "The configuration for the Kubernetes auth backend."
  value = {
    kubernetes_host        = var.kubernetes_host
    kubernetes_ca_cert     = var.kubernetes_ca_cert
    token_reviewer_jwt     = var.token_reviewer_jwt
    issuer                 = var.issuer
    disable_iss_validation = var.disable_iss_validation
  }
}

//

# # Output for Kubernetes Service Account Name
# output "service_account_name" {
#   value       = kubernetes_service_account.example.metadata[0].name
#   description = "The name of the created Kubernetes service account."
# }

# # Output for Kubernetes Service Account Namespace
# output "service_account_namespace" {
#   value       = kubernetes_service_account.example.metadata[0].namespace
#   description = "The namespace of the created Kubernetes service account."
# }

# # Output for Vault Kubernetes Secret Backend Role Name
# output "vault_kubernetes_secret_backend_role_name" {
#   value       = vault_kubernetes_secret_backend_role.sa-example.name
#   description = "The name of the Vault Kubernetes secret backend role."
# }

# # Output for Vault Kubernetes Secret Backend Role Allowed Kubernetes Namespaces
# output "vault_kubernetes_secret_backend_role_allowed_namespaces" {
#   value       = vault_kubernetes_secret_backend_role.sa-example.allowed_kubernetes_namespaces
#   description = "The allowed Kubernetes namespaces for the Vault Kubernetes secret backend role."
# }

# # Output for Vault Kubernetes Secret Backend Role Service Account Name
# output "vault_kubernetes_secret_backend_role_service_account_name" {
#   value       = vault_kubernetes_secret_backend_role.sa-example.service_account_name
#   description = "The service account name associated with the Vault Kubernetes secret backend role."
# }

# # Output for Vault Kubernetes Secret Backend Role Extra Labels
# output "vault_kubernetes_secret_backend_role_extra_labels" {
#   value       = vault_kubernetes_secret_backend_role.sa-example.extra_labels
#   description = "Extra labels defined for the Vault Kubernetes secret backend role."
# }

# # Output for Vault Kubernetes Secret Backend Role Extra Annotations
# output "vault_kubernetes_secret_backend_role_extra_annotations" {
#   value       = vault_kubernetes_secret_backend_role.sa-example.extra_annotations
#   description = "Extra annotations defined for the Vault Kubernetes secret backend role."
# }

# # Output for Kubernetes Role Binding Name
# output "kubernetes_role_binding_name" {
#   value       = kubernetes_role_binding.example.metadata[0].name
#   description = "The name of the Kubernetes role binding."
# }

# # Output for Kubernetes Role Binding Namespace
# output "kubernetes_role_binding_namespace" {
#   value       = kubernetes_role_binding.example.metadata[0].namespace
#   description = "The namespace of the Kubernetes role binding."
# }

# # Output for Kubernetes Role Binding Subjects
# output "kubernetes_role_binding_subjects" {
#   value       = kubernetes_role_binding.example.subject
#   description = "The subjects (service account) bound to the Kubernetes role in the role binding."
# }

# # Output for Kubernetes Role Binding Role Reference
# output "kubernetes_role_binding_role_ref" {
#   value       = kubernetes_role_binding.example.role_ref
#   description = "The role reference for the Kubernetes role binding."
# }


# ////

# output "vault_kubernetes_secret_backend_role" {
#   description = "The Vault Kubernetes Secret Backend Role created"
#   value       = vault_kubernetes_secret_backend_role.rules-example.name
# }

# output "kubernetes_role" {
#   description = "The Kubernetes Role for Vault integration"
#   value       = kubernetes_role.vault_k8s_secrets_role.metadata[0].name
# }

# output "kubernetes_role_binding" {
#   description = "The Kubernetes Role Binding for Vault integration"
#   value       = kubernetes_role_binding.vault_role_binding.metadata[0].name
# }


# output "kubernetes_namespace" {
#   description = "The namespace where the Kubernetes Role and Role Binding are applied"
#   value       = var.kubernetes_namespace
# }

# output "vault_kubernetes_secret_backend_path" {
#   description = "The path to the Vault Kubernetes Secret Backend"
#   value       = vault_kubernetes_secret_backend.config.path
# }

# output "vault_kubernetes_secret_backend_description" {
#   description = "Description of the Vault Kubernetes Secret Backend"
#   value       = vault_kubernetes_secret_backend.config.description
# }
