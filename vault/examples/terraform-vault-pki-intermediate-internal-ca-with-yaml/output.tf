output "token_roles" {
  value = [for v in module.terraform-vault-pki-intermediate-internal-ca-with-yaml : v.role_name]
}



output "vault_pki_mount_paths" {
  description = "The paths where the PKI mounts are created."
  value = {
    for mesh, module in module.terraform-vault-pki-intermediate-internal-ca-with-yaml :
    mesh => module.vault_pki_mount_path
  }
}

output "vault_pki_intermediate_csrs" {
  description = "The Certificate Signing Requests (CSRs) generated for the intermediate certificates."
  value = {
    for mesh, module in module.terraform-vault-pki-intermediate-internal-ca-with-yaml :
    mesh => module.vault_pki_intermediate_csr
  }
}

output "vault_pki_signed_certificates" {
  description = "The signed intermediate CA certificates."
  value = {
    for mesh, module in module.terraform-vault-pki-intermediate-internal-ca-with-yaml :
    mesh => module.vault_pki_signed_certificate
  }
}

output "vault_pki_role_names" {
  description = "The names of the PKI roles that can be used to request certificates."
  value = {
    for mesh, module in module.terraform-vault-pki-intermediate-internal-ca-with-yaml :
    mesh => module.vault_pki_role_name
  }
}

output "vault_pki_policy_names" {
  description = "The names of the Vault policies that grant access to issue certificates."
  value = {
    for mesh, module in module.terraform-vault-pki-intermediate-internal-ca-with-yaml :
    mesh => module.vault_pki_policy_name
  }
}

output "vault_token_role_names" {
  description = "The token roles that allow creating tokens with the certificate-issuing policy attached."
  value = {
    for mesh, module in module.terraform-vault-pki-intermediate-internal-ca-with-yaml :
    mesh => module.vault_token_role_name
  }
}
