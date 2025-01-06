module "terraform-vault-ssh-otp" {
  source               = "../../modules/terraform-vault-ssh-otp"
  ssh_path             = "ssh"
  ssh_ca_role          = "ca"
  ssh_ca_allowed_users = "ubuntu"
  ssh_ca_default_extensions = {
    permit-pty             = ""
    permit-port-forwarding = ""
  }
  ssh_ca_ttl            = "300"
  ssh_otp_role          = "otp"
  ssh_otp_allowed_users = "ubuntu"
  ssh_otp_default_user  = "ubuntu"
  ssh_otp_cidr_list     = "0.0.0.0/0"

}
