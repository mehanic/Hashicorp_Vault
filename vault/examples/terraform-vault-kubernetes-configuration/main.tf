module "terraform-vault-kubernetes-configuration" {
  source   = "../../modules/terraform-vault-kubernetes-configuration"
  backend  = "kubernetes-vault"
  name     = "kubernetes"
  audience = "vault"

  token_ttl     = null
  token_max_ttl = null

  bound_service_account_names      = ["first"]
  bound_service_account_namespaces = ["default"]

  policies           = []
  policy_definitions = []

  auth_path              = "kubernetes"
  disable_remount        = false
  description            = "Kubernetes Auth Method"
  local                  = false
  tune_default_lease_ttl = null
  tune_max_lease_ttl     = null

  audit_non_hmac_response_keys = []
  audit_non_hmac_request_keys  = []
  listing_visibility           = null
  passthrough_request_headers  = []
  allowed_response_headers     = []
  token_type                   = null

  kubernetes_host    = "https://kubernetes.default.svc"
  kubernetes_ca_cert = "-----BEGIN CERTIFICATE-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAzF5Dd97TnZZ2SZ7EcxuD\n-----END CERTIFICATE-----"

  token_reviewer_jwt     = "eyJhbGciOiJSUzI1NiIsImtpZCI6IjEwMjY2NTMyMSIsIng1YyI6IjMiLCJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImtpZCI6IjEwMjY2NTMyMSIsIng1YyI6IjMiLCJ0eXAiOiJKV1Qi" # Replace with a real token
  issuer                 = "kubernetes"
  disable_iss_validation = false

  kubernetes_secret_backend_description = "Kubernetes secrets engine to manage Kubernetes secrets."
  default_lease_ttl_seconds             = "43200"
  max_lease_ttl_seconds                 = "86400"
  service_account_jwt                   = "eyJhbGciOiJSUzI1NiIsImtpZCI6IjEwMjY2NTMyMSIsIng1YyI6IjMiLCJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImtpZCI6IjEwMjY2NTMyMSIsIng1YyI6IjMiLCJ0eXAiOiJKV1Qi" # Replace with a real token
  disable_local_ca_jwt                  = "false"

  service_account_name = "test-service-account-with-generated-token"
  kubernetes_namespace = "default"
  token_default_ttl    = "21600"
  kubernetes_role_name = "vault-k8s-secrets-role"

}
