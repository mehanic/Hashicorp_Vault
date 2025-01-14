output "role_name" {
  value = vault_pki_secret_backend_role.this.name
}


output "vault_pki_mount_path" {
  description = "The path where the PKI mount is created."
  value       = vault_mount.this.path
}

output "vault_pki_intermediate_csr" {
  description = "The Certificate Signing Request (CSR) generated for the intermediate certificate."
  value       = vault_pki_secret_backend_intermediate_cert_request.this.csr
}

output "vault_pki_signed_certificate" {
  description = "The signed intermediate CA certificate."
  value       = vault_pki_secret_backend_intermediate_set_signed.this.certificate
}

output "vault_pki_role_name" {
  description = "The name of the PKI role that can be used to request certificates."
  value       = vault_pki_secret_backend_role.this.name
}

output "vault_pki_policy_name" {
  description = "The name of the Vault policy that grants access to issue certificates."
  value       = vault_policy.this.name
}

output "vault_token_role_name" {
  description = "The token role that allows creating tokens with the certificate-issuing policy attached."
  value       = vault_token_auth_backend_role.this.role_name
}
