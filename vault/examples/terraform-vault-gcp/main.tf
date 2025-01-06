module "terraform-vault-gcp" {
  source             = "../../modules/terraform-vault-gcp"
  gcp_credentials    = "{\"type\": \"service_account\", \"project_id\": \"your-project-id\", \"private_key_id\": \"your-private-key-id\", \"private_key\": \"-----BEGIN PRIVATE KEY-----\\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCAT4wggE2AgEAAkEAr5OgDbmTTuAZoGyjK0zzxa8W0VptwZGVz2kT2z5BFX9uTu10Al1Z7YeeQsNVnIzXh0u4oX1TmGbBXIUpquzFzqYoAyZefwQpnRExRHY8SlgLgghzW9aauLfU4V9e8tXW2G1uJmZ//osrpQowcQywi8PbVhziXchD/S7NmSg5n8jCh4aV6kPbxGqPsy7R8w==\\n-----END PRIVATE KEY-----\\n\", \"client_email\": \"your-service-account@your-project.iam.gserviceaccount.com\", \"client_id\": \"your-client-id\", \"auth_uri\": \"https://accounts.google.com/o/oauth2/auth\", \"token_uri\": \"https://oauth2.googleapis.com/token\", \"auth_provider_x509_cert_url\": \"https://www.googleapis.com/oauth2/v1/certs\", \"client_x509_cert_url\": \"https://www.googleapis.com/robot/v1/metadata/x509/your-service-account%40your-project.iam.gserviceaccount.com\"}"
  gcp_role_name      = "gcp-role"
  gcp_bound_zones    = ["us-central1-a", "us-west1-b"]
  gcp_bound_projects = ["project-12345", "project-67890"]
  gcp_token_policies = ["default", "gcp-policy"]
  gcp_token_ttl      = 3600
  gcp_token_max_ttl  = 86400
  gcp_path           = "gcp_vault"

}