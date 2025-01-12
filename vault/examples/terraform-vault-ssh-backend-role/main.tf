module "terraform-vault-ssh-backend-role" {
  source                  = "../../modules/terraform-vault-ssh-backend-role"
  ssh_mount_path          = "ssh_signed_keys_vault"
  client_keys_role_name   = "client_keys"
  key_type                = "ca"
  allow_host_certificates = false
  allow_subdomains        = false
  allow_user_key_ids      = false
  allow_user_certificates = true
  default_extensions = {
    "permit-pty" = ""
  }
  allowed_extensions = "permit-pty,permit-port-forwarding"
  default_user       = "martin"
  allowed_users      = "martin,ubuntu"
  max_ttl            = "30m"
  ttl                = "10m"
  cidr_list          = "172.16.0.0/16"


}
