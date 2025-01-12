module "terraform-vault-ssh-ca" {
  source                    = "../../modules/terraform-vault-ssh-ca"
  ssh_mount_path            = "sshca_custom"
  ssh_ca_description        = "Custom SSH Certificate Authority for kitchen"
  default_lease_ttl_seconds = 86400  # 1 day
  max_lease_ttl_seconds     = 604800 # 7 days
  generate_signing_key      = true   //generate pub key
  ssh_group_name            = "custom_ssh_users"
  ssh_policy_name           = "custom_allow_ca"
  userpass_group_name       = "custom_userpass_users"
  userpass_policy_name      = "custom_allow_changing_password"
  kitchen_entity_name       = "custom_kitchen"
  kitchen_role_name         = "custom_kitchen_role"
  allowed_users             = "custom_kitchen"
  default_user              = "custom_kitchen"
  default_extensions = {
    "permit-port-forwarding"  = "yes",
    "permit-pty"              = "yes",
    "permit-agent-forwarding" = "yes",
  }
  key_type                = "ca"
  allow_user_certificates = true


}
