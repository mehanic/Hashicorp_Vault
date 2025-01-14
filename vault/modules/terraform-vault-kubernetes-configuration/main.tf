# Define and tune Kubernetes auth backend
resource "vault_auth_backend" "kubernetes" {
  type            = "kubernetes"
  path            = var.auth_path # Ensure this matches the expected path
  disable_remount = var.disable_remount
  description     = var.description
  local           = var.local

  tune {
    default_lease_ttl            = var.tune_default_lease_ttl
    max_lease_ttl                = var.tune_max_lease_ttl
    audit_non_hmac_response_keys = var.audit_non_hmac_response_keys
    audit_non_hmac_request_keys  = var.audit_non_hmac_request_keys
    listing_visibility           = var.listing_visibility
    passthrough_request_headers  = var.passthrough_request_headers
    allowed_response_headers     = var.allowed_response_headers
    token_type                   = var.token_type
  }
}

# Configure Kubernetes auth backend role with dynamic policy assignment
resource "vault_kubernetes_auth_backend_role" "kubernetes_auth_backend_role" {
  depends_on                       = [vault_auth_backend.kubernetes] # Ensure backend is initialized first
  backend                          = var.auth_path                   # Use the same path as `vault_auth_backend`
  role_name                        = var.name
  audience                         = var.audience
  bound_service_account_names      = var.bound_service_account_names
  bound_service_account_namespaces = var.bound_service_account_namespaces
  token_ttl                        = var.token_ttl
  token_max_ttl                    = var.token_max_ttl
  token_policies                   = concat(vault_policy.this[*].name, var.policies)
}




# Kubernetes Auth Backend Configuration
resource "vault_kubernetes_auth_backend_config" "example" {
  backend                = vault_auth_backend.kubernetes.path
  kubernetes_host        = var.kubernetes_host
  kubernetes_ca_cert     = var.kubernetes_ca_cert
  token_reviewer_jwt     = var.token_reviewer_jwt
  issuer                 = var.issuer
  disable_iss_validation = var.disable_iss_validation
}



resource "vault_kubernetes_secret_backend" "config" {
  path                      = var.auth_path
  description               = var.kubernetes_secret_backend_description
  default_lease_ttl_seconds = var.default_lease_ttl_seconds
  max_lease_ttl_seconds     = var.max_lease_ttl_seconds
  kubernetes_host           = var.kubernetes_host
  kubernetes_ca_cert        = var.kubernetes_ca_cert
  service_account_jwt       = var.service_account_jwt
  disable_local_ca_jwt      = var.disable_local_ca_jwt
}


# # Kubernetes Secret Backend Role with Service Account Integration
# resource "vault_kubernetes_secret_backend_role" "sa-example" {
#   backend                       = vault_kubernetes_secret_backend.config.path
#   name                          = "service-account-name-role"
#   allowed_kubernetes_namespaces = ["*"]  # Adjust based on your namespace requirements
#   token_max_ttl                 = var.token_max_ttl  # Use variable for token TTLs
#   token_default_ttl             = var.token_default_ttl
#   service_account_name          = var.service_account_name  # Service Account name for binding

#   extra_labels = {
#     id   = "abc123"
#     name = "some_name"
#   }

#   extra_annotations = {
#     env      = "development"
#     location = "earth"
#   }
# }

# # Example of Kubernetes Service Account Integration
# resource "kubernetes_service_account" "example" {
#   metadata {
#     name      = var.service_account_name
#     namespace = var.kubernetes_namespace  # Specify the Kubernetes namespace
#   }
# }

# # Example Kubernetes role binding (corrected)
# resource "kubernetes_role_binding" "example" {
#   metadata {
#     name      = "example-role-binding"
#     namespace = var.kubernetes_namespace
#   }

#   subject {
#     kind      = "ServiceAccount"
#     name      = kubernetes_service_account.example.metadata[0].name
#     namespace = kubernetes_service_account.example.metadata[0].namespace
#   }

#   role_ref {
#     kind     = "Role"
#     name     = "example-role"
#     api_group = "rbac.authorization.k8s.io"
#   }
# }



# # Vault Kubernetes Secret Backend Role (with Kubernetes Role)
# resource "vault_kubernetes_secret_backend_role" "name-example" {
#   backend                       = vault_kubernetes_secret_backend.config.path
#   name                          = "service-account-name-role"
#   allowed_kubernetes_namespaces = ["*"]  # Specify namespaces as needed
#   token_max_ttl                 = var.token_max_ttl
#   token_default_ttl             = var.token_default_ttl
#   kubernetes_role_name          = var.kubernetes_role_name

#   extra_labels = {
#     id   = "abc123"
#     name = "some_name"
#   }

#   extra_annotations = {
#     env      = "development"
#     location = "earth"
#   }
# }

# # Vault Kubernetes Secret Backend Role (with generated role rules)
# resource "vault_kubernetes_secret_backend_role" "rules-example" {
#   backend                       = vault_kubernetes_secret_backend.config.path
#   name                          = "service-account-name-role"
#   allowed_kubernetes_namespaces = ["*"]
#   token_max_ttl                 = var.token_max_ttl
#   token_default_ttl             = var.token_default_ttl
#   kubernetes_role_type          = "Role"
#   generated_role_rules          = <<EOF
# rules:
# - apiGroups: [""]
#   resources: ["pods"]
#   verbs: ["list"]
# EOF

#   extra_labels = {
#     id   = "abc123"
#     name = "some_name"
#   }

#   extra_annotations = {
#     env      = "development"
#     location = "earth"
#   }
# }

# # # Kubernetes Service Account Integration
# # resource "kubernetes_service_account" "example" {
# #   metadata {
# #     name      = var.service_account_name
# #     namespace = var.kubernetes_namespace
# #   }
# # }

# # Kubernetes Role for Vault Integration
# resource "kubernetes_role" "vault_k8s_secrets_role" {
#   metadata {
#     name      = var.kubernetes_role_name
#     namespace = var.kubernetes_namespace
#   }

#   rule {
#     api_groups = [""]
#     resources  = ["secrets"]
#     verbs      = ["get", "list"]
#   }
# }

# # Kubernetes Role Binding for Vault Integration
# resource "kubernetes_role_binding" "vault_role_binding" {
#   metadata {
#     name      = "vault-k8s-secrets-role-binding"
#     namespace = var.kubernetes_namespace
#   }

#   subject {
#     kind      = "ServiceAccount"
#     name      = kubernetes_service_account.example.metadata[0].name
#     namespace = kubernetes_service_account.example.metadata[0].namespace
#   }

#   role_ref {
#     kind      = "Role"
#     name      = kubernetes_role.vault_k8s_secrets_role.metadata[0].name
#     api_group = "rbac.authorization.k8s.io"
#   }
# }




# Create a Vault policy from the provided policy definitions
resource "vault_policy" "this" {
  count  = length(var.policy_definitions) > 0 ? 1 : 0
  name   = replace("${var.auth_path}_${var.name}", "/", "_") # Ensure name matches backend
  policy = join("\n\n", var.policy_definitions)
}