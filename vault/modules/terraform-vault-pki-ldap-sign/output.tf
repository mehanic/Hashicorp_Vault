
output "ldap_auth_backend_path" {
  description = "Path of the LDAP authentication backend."
  value       = vault_ldap_auth_backend.ldap.path
}

output "ldap_group_name" {
  description = "Name of the LDAP group configured for the code signing policy."
  value       = vault_ldap_auth_backend_group.group.groupname
}

output "pki_backend_path" {
  description = "Path of the PKI backend used for certificate issuance."
  value       = vault_mount.pki.path
}

output "issuing_certificates_url" {
  description = "Issuing certificates URL for the PKI configuration."
  value       = vault_pki_secret_backend_config_urls.config_urls.issuing_certificates[0]
}

output "crl_distribution_points_url" {
  description = "CRL distribution points URL for the PKI configuration."
  value       = vault_pki_secret_backend_config_urls.config_urls.crl_distribution_points[0]
}

output "root_cert_common_name" {
  description = "Common name of the root CA for code signing."
  value       = vault_pki_secret_backend_root_cert.code_sign_root_ca.common_name
}

output "pki_role_name" {
  description = "Name of the PKI role for code signing."
  value       = vault_pki_secret_backend_role.code_sign.name
}

output "pki_role_ttl" {
  description = "TTL for the code signing role."
  value       = vault_pki_secret_backend_role.code_sign.ttl
}

