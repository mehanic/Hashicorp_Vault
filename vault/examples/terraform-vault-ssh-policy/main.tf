module "terraform-vault-ssh-policy" {
  source   = "../../modules/terraform-vault-ssh-policy"
 module_depends_on = null

ssh_secret_path = "ssh"

ssh_backend_role_name = "ssh_backend_role"

ttl = "30m0s"

default_extensions = {
  "permit-pty" = ""
}

default_user = "core"

allowed_users = "*"

allowed_extensions = "permit-pty"

algorithm_signer = "rsa-sha2-256"


}
