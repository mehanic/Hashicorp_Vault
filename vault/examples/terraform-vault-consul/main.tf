module "terraform-vault-consul" {
  source        = "../../modules/terraform-vault-consul"
  vault_address = "http://127.0.0.1:8200"
  vault_token   = "s.a1b2c3d4e5f6g7h8i9j0" # Replace with your Vault token

  consul_path        = "consul"
  consul_description = "Manages the Consul backend"
  consul_address     = "127.0.0.1:8500"
  consul_token       = "abcd1234-ab12-cd34-ef56-abcdef123456"

  consul_scheme      = "http"
  consul_ca_cert     = "" # Add path to your CA cert if applicable
  consul_client_cert = "" # Add path to your client cert if applicable
  consul_client_key  = "" # Add path to your client key if applicable

  default_lease_ttl_seconds = 120
  max_lease_ttl_seconds     = 240
  disable_remount           = false
  local                     = false

  consul_role_name    = "example-role"
  consul_policies     = ["example-policy"]
  consul_role_max_ttl = 3600
  consul_role_ttl     = 1800
  consul_role_local   = false
  consul_namespace    = "default"



}