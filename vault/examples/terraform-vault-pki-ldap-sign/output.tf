
output "ldap_auth_backend_path" {
  description = "Path of the LDAP authentication backend."
  value       = module.terraform-vault-pki-ldap-sign.ldap_auth_backend_path
}

output "ldap_group_name" {
  description = "Name of the LDAP group configured for the code signing policy."
  value       = module.terraform-vault-pki-ldap-sign.ldap_group_name
}

output "pki_backend_path" {
  description = "Path of the PKI backend used for certificate issuance."
  value       = module.terraform-vault-pki-ldap-sign.pki_backend_path
}

output "issuing_certificates_url" {
  description = "Issuing certificates URL for the PKI configuration."
  value       = module.terraform-vault-pki-ldap-sign.issuing_certificates_url
}

output "crl_distribution_points_url" {
  description = "CRL distribution points URL for the PKI configuration."
  value       = module.terraform-vault-pki-ldap-sign.crl_distribution_points_url
}

output "root_cert_common_name" {
  description = "Common name of the root CA for code signing."
  value       = module.terraform-vault-pki-ldap-sign.root_cert_common_name
}

output "pki_role_name" {
  description = "Name of the PKI role for code signing."
  value       = module.terraform-vault-pki-ldap-sign.pki_role_name
}

output "pki_role_ttl" {
  description = "TTL for the code signing role."
  value       = module.terraform-vault-pki-ldap-sign.pki_role_ttl
}

