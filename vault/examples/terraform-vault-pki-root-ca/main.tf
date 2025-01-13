module "terraform-vault-pki-root-ca" {
  source = "../../modules/terraform-vault-pki-root-ca"

  name        = "certificate"                       # Name of the certificate resource or service
  description = "A description for the certificate" # Provide a relevant description
  path        = "/pki/certs"                        # Path to use for certificate-related operations
  urls_prefix = [
    "https://pki.example.com", # Add URLs for distribution points or endpoints
    "https://vault.example.com"
  ]


}