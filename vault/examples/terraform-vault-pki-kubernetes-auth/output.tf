# Output the Kubernetes Auth Backend Path
output "kubernetes_auth_backend_path" {
  description = "Path to the Kubernetes authentication backend"
  value       = module.terraform-vault-pki-kubernetes-auth.kubernetes_auth_backend_path
}

# Output the Kubernetes Auth Backend Role for role1
output "kubernetes_auth_backend_role_name" {
  description = "Role name for Kubernetes authentication"
  value       = module.terraform-vault-pki-kubernetes-auth.kubernetes_auth_backend_role_name
}

# Output the Vault PKI Root CA certificate (Base64 encoded)
output "root_ca_certificate" {
  description = "The root CA certificate in PEM format"
  value       = module.terraform-vault-pki-kubernetes-auth.root_ca_certificate
}

# Output the signed certificate for the short PKI backend
output "short_pki_intermediate_signed_certificate" {
  description = "The signed intermediate certificate for the short PKI backend"
  value       = module.terraform-vault-pki-kubernetes-auth.short_pki_intermediate_signed_certificate
}

# Output the PKI Role for App1
output "pki_role_app1_name" {
  description = "Name of the PKI role for App1"
  value       = module.terraform-vault-pki-kubernetes-auth.pki_role_app1_name
}

# Output the PKI Short mount path
output "pki_short_mount_path" {
  description = "Path to the short PKI mount"
  value       = module.terraform-vault-pki-kubernetes-auth.pki_short_mount_path
}

# Output the PKI Root mount path
output "pki_root_mount_path" {
  description = "Path to the root PKI mount"
  value       = module.terraform-vault-pki-kubernetes-auth.pki_root_mount_path
}

# Output the Kubernetes Auth Backend Config
output "kubernetes_auth_backend_config" {
  description = "The configuration for the Kubernetes Auth Backend"
  value       = module.terraform-vault-pki-kubernetes-auth.kubernetes_auth_backend_config
  sensitive   = true
}

# Output the Vault policy for app1
output "vault_policy_pki_app1" {
  description = "The Vault policy for app1"
  value       = module.terraform-vault-pki-kubernetes-auth.vault_policy_pki_app1
}

# Output the role bound to the Kubernetes Auth Backend
output "kubernetes_auth_backend_role_bound_service_accounts" {
  description = "List of bound service accounts for the Kubernetes role"
  value       = module.terraform-vault-pki-kubernetes-auth.kubernetes_auth_backend_role_bound_service_accounts
}

# Output the role token policies for app1
output "kubernetes_auth_backend_role_token_policies" {
  description = "List of token policies for the Kubernetes role"
  value       = module.terraform-vault-pki-kubernetes-auth.kubernetes_auth_backend_role_token_policies
}

# Output the policy document for app1
output "vault_policy_document_pki_app1" {
  description = "The policy document for app1"
  value       = module.terraform-vault-pki-kubernetes-auth.vault_policy_document_pki_app1
}
