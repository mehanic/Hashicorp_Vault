module "terraform-vault-cert-auth" {
  source = "../../modules/terraform-vault-cert-auth"
  # terraform.tfvars

  # List of paths to the configuration secrets in Vault
  config_paths = [
    "secret/data/my-config",
    "secret/data/another-config",
    "secret/data/my-app/secrets"
  ]

  # Mount path for the cert auth backend
  cert_auth_mount_path = "cert"

  # Name of the policy to access configuration secrets
  config_policy_name = "config-access-policy"

  # Name of the cert auth backend role
  cert_auth_role_name = "foo"

  # Path to the certificate file
  cert_file_path = "../../modules/terraform-vault-cert-auth/cert/cert.pem"

  # Common names allowed for client certificates
  allowed_common_names = ["foo.example.org", "baz.example.org"]

  # DNS SANs allowed for client certificates
  allowed_dns_sans = []

  # TTL for tokens issued by the role
  token_ttl = 300

  # Maximum TTL for tokens issued by the role
  token_max_ttl = 600

  # Policies associated with tokens issued by the role
  token_policies = ["foo"]

  # Enable OCSP validation for client certificates
  ocsp_enabled = false

  # Allow authentication to proceed if OCSP response is unavailable
  ocsp_fail_open = false

  # Type of token to issue (service, batch, default)
  token_type = "service"

  # CIDRs that can authenticate and be bound to the token
  token_bound_cidrs = []

  # Maximum number of times a token may be used
  token_num_uses = 0

}