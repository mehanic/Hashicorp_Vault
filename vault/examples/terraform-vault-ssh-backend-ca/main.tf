module "terraform-vault-ssh-backend-ca" {
  source                       = "../../modules/terraform-vault-ssh-backend-ca"
  ssh_generate_signing_key     = true
  ssh_private_key              = null
  ssh_public_key               = null
  ssh_backend_role_name        = "ssh_example"
  ssh_key_type                 = "ca"
  ssh_default_ttl              = 3600
  ssh_max_ttl                  = 3600
  ssh_allow_bare_domains       = true
  ssh_allow_host_certificates  = true
  ssh_allow_subdomains         = true
  ssh_allow_user_certificates  = true
  ssh_allow_user_key_ids       = true
  ssh_allowed_critical_options = null
  ssh_allowed_domains          = null
  ssh_allowed_extensions       = null
  ssh_allowed_users            = null
  ssh_allowed_user_key_lengths = null
  ssh_default_extensions = {
    "permit-port-forwarding"  = "",
    "permit-pty"              = "",
    "permit-agent-forwarding" = ""
  }
  ssh_default_critical_options = null
  ssh_cidr_list                = null
  ssh_default_user             = null
  ssh_key_id_format            = null
  default_lease                = 3600
  max_lease                    = 3600
  seal_wrap                    = true
  local_mount                  = true
  external_entropy_access      = false
  path                         = "ssh-vault-ca"


}
