output "cert_auth_backend_path" {
  description = "The path where the cert auth backend is mounted."
  value       = module.terraform-vault-cert-auth.cert_auth_backend_path
}

output "cert_auth_backend_role_name" {
  description = "The name of the cert auth backend role."
  value       = module.terraform-vault-cert-auth.cert_auth_backend_role_name
}

output "cert_auth_role_certificate_path" {
  description = "The certificate file path used for the cert auth backend role."
  value       = module.terraform-vault-cert-auth.cert_auth_role_certificate_path
}

output "cert_auth_role_allowed_common_names" {
  description = "List of allowed common names for the cert auth backend role."
  value       = module.terraform-vault-cert-auth.cert_auth_role_allowed_common_names
}

output "cert_auth_role_allowed_dns_sans" {
  description = "List of allowed DNS SANs for the cert auth backend role."
  value       = module.terraform-vault-cert-auth.cert_auth_role_allowed_dns_sans
}

output "cert_auth_role_token_policies" {
  description = "List of policies associated with the cert auth backend role tokens."
  value       = module.terraform-vault-cert-auth.cert_auth_role_token_policies
}

output "cert_auth_role_token_ttl" {
  description = "The TTL of tokens issued by the cert auth backend role."
  value       = module.terraform-vault-cert-auth.cert_auth_role_token_ttl
}

output "cert_auth_role_token_max_ttl" {
  description = "The max TTL of tokens issued by the cert auth backend role."
  value       = module.terraform-vault-cert-auth.cert_auth_role_token_max_ttl
}

output "cert_auth_role_token_type" {
  description = "The token type used by the cert auth backend role."
  value       = module.terraform-vault-cert-auth.cert_auth_role_token_type
}

output "cert_auth_role_token_bound_cidrs" {
  description = "The CIDR blocks to which tokens are bound for the cert auth backend role."
  value       = module.terraform-vault-cert-auth.cert_auth_role_token_bound_cidrs
}
