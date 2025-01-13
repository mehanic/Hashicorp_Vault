# # Output variables
# output "cert_auth_mount_path" {
#     value = vault_auth_backend.cert.path
# }

# output "cert_auth_role_name" {
#     value = vault_cert_auth_backend_role.cert.name
# }


output "cert_auth_backend_path" {
  description = "The path where the cert auth backend is mounted."
  value       = vault_auth_backend.cert.path
}

output "cert_auth_backend_role_name" {
  description = "The name of the cert auth backend role."
  value       = vault_cert_auth_backend_role.cert_role.name
}

output "cert_auth_role_certificate_path" {
  description = "The certificate file path used for the cert auth backend role."
  value       = var.cert_file_path
}

output "cert_auth_role_allowed_common_names" {
  description = "List of allowed common names for the cert auth backend role."
  value       = var.allowed_common_names
}

output "cert_auth_role_allowed_dns_sans" {
  description = "List of allowed DNS SANs for the cert auth backend role."
  value       = var.allowed_dns_sans
}

output "cert_auth_role_token_policies" {
  description = "List of policies associated with the cert auth backend role tokens."
  value       = var.token_policies
}

output "cert_auth_role_token_ttl" {
  description = "The TTL of tokens issued by the cert auth backend role."
  value       = var.token_ttl
}

output "cert_auth_role_token_max_ttl" {
  description = "The max TTL of tokens issued by the cert auth backend role."
  value       = var.token_max_ttl
}

output "cert_auth_role_token_type" {
  description = "The token type used by the cert auth backend role."
  value       = var.token_type
}

output "cert_auth_role_token_bound_cidrs" {
  description = "The CIDR blocks to which tokens are bound for the cert auth backend role."
  value       = var.token_bound_cidrs
}
