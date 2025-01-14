# Output the root PKI mounts created
output "pki_roots" {
  description = "Root PKI mounts created with their paths"
  value       = module.terraform-vault-pki-backend-issuer.pki_roots
}

# Output root certificate details
output "root_certificates" {
  description = "Root PKI certificate information"
  value       = module.terraform-vault-pki-backend-issuer.root_certificates
}

# Output intermediate PKI paths and their roots
output "pki_intermediates" {
  description = "Intermediate PKI mounts and their parent root PKI"
  value       = module.terraform-vault-pki-backend-issuer.pki_intermediates
}

# Output role definitions for intermediates
output "pki_roles" {
  description = "Roles defined in the PKI intermediate backends"
  value       = module.terraform-vault-pki-backend-issuer.pki_roles
}

# Output the complete PKI paths created
output "pki_paths" {
  description = "All PKI paths created in Vault"
  value       = module.terraform-vault-pki-backend-issuer.pki_paths
}
