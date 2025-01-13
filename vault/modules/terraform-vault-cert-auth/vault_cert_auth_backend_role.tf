# Cert Auth Backend Role
resource "vault_cert_auth_backend_role" "cert_role" {
  name                 = var.cert_auth_role_name
  certificate          = file(var.cert_file_path)
  backend              = vault_auth_backend.cert.path
  allowed_common_names = var.allowed_common_names
  allowed_dns_sans     = var.allowed_dns_sans
  token_ttl            = var.token_ttl
  token_max_ttl        = var.token_max_ttl
  token_policies       = [vault_policy.config_policy.name]
  ocsp_enabled         = var.ocsp_enabled
  ocsp_fail_open       = var.ocsp_fail_open
  token_type           = var.token_type
  token_bound_cidrs    = var.token_bound_cidrs
  token_num_uses       = var.token_num_uses
}
