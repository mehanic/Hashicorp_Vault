locals {
    # Create the policy with the list of configuration secrets paths
    config_policy = join("\n", [
        for path in var.config_paths : format("path \"%s\" { capabilities = [\"read\"] }", path)
    ])
}


# # Cert Auth Backend
# resource "vault_auth_backend" "cert" {
#     depends_on = [ var.module_depends_on ]
#     type = "cert"
#     path = var.cert_auth_mount_path
# }

# Policy for the cert auth backend
resource "vault_policy" "config_policy" {
    name   = var.config_policy_name
    policy = local.config_policy
}

# # Role for the cert auth backend
# resource "vault_cert_auth_backend_role" "cert" {
#     name           = var.cert_auth_role_name
#     certificate    = var.cert
#     backend        = vault_auth_backend.cert.path
#     token_policies = [ vault_policy.config_policy.name ]
# }



# Cert Auth Backend
resource "vault_auth_backend" "cert" {
  //path = "cert"
   path = var.cert_auth_mount_path
  type = "cert"
}

# Cert Auth Backend Role
resource "vault_cert_auth_backend_role" "cert_role" {
  name                           = var.cert_auth_role_name
  certificate                    = file(var.cert_file_path)
  backend                        = vault_auth_backend.cert.path
  allowed_common_names           = var.allowed_common_names
  allowed_dns_sans               = var.allowed_dns_sans
  token_ttl                      = var.token_ttl
  token_max_ttl                  = var.token_max_ttl
  token_policies                 = [ vault_policy.config_policy.name ]
  ocsp_enabled                   = var.ocsp_enabled
  ocsp_fail_open                 = var.ocsp_fail_open
  token_type                     = var.token_type
  token_bound_cidrs              = var.token_bound_cidrs
  token_num_uses                 = var.token_num_uses
}



# openssl genrsa -out root-key.pem 4096
# openssl req -x509 -new -nodes -key root-key.pem -sha256 -days 3650 -out root-ca.pem -subj "/C=US/ST=California/L=San Francisco/O=Corp/OU=Platform/CN=RootCA"
# openssl genrsa -out cert-key.pem 2048
# openssl req -new -key cert-key.pem -out cert.csr -subj "/C=US/ST=California/L=San Francisco/O=Corp/OU=Platform/CN=foo.example.org"
# openssl x509 -req -in cert.csr -CA root-ca.pem -CAkey root-key.pem -CAcreateserial -out cert.pem -days 365 -sha256
# mv root-ca.pem /path/to/certs/ca-cert.pem



# ╰─λ openssl genrsa -out root-key.pem 4096                                 

# ╰─λ ls                                                                    
# root-key.pem

# ╰─λ openssl req -x509 -new -nodes -key root-key.pem -sha256 -days 3650 -out root-ca.pem -subj "/C=US/ST=California/L=San Francisco/O=Corp/OU=Platform/CN=RootCA"

# ╰─λ ls                                                                     
# root-ca.pem  root-key.pem
# ╰─λ openssl genrsa -out cert-key.pem 2048                                  

# ╰─λ ls                                                                     
# cert-key.pem  root-ca.pem  root-key.pem
# ╰─λ openssl req -new -key cert-key.pem -out cert.csr -subj "/C=US/ST=California/L=San Francisco/O=Corp/OU=Platform/CN=foo.example.org"

# ╰─λ ls                                                                     
# cert.csr  cert-key.pem  root-ca.pem  root-key.pem

# ╰─λ openssl x509 -req -in cert.csr -CA root-ca.pem -CAkey root-key.pem -CAcreateserial -out cert.pem -days 365 -sha256

# Certificate request self-signature ok
# subject=C = US, ST = California, L = San Francisco, O = Corp, OU = Platform, CN = foo.example.org
# ╰─λ ls                                                                    
# cert.csr  cert-key.pem  cert.pem  root-ca.pem  root-ca.srl  root-key.pem
