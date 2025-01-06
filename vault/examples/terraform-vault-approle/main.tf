module "terraform-vault-approle" {
  source                    = "../../modules/terraform-vault-approle"
  approle_path              = "approle_k8s"
  role_name                 = "terraform"
  policies                  = ["default", "terraform"]
  k8s_path                  = "k8s"
  kv_path                   = "kv_k8s"
  default_lease_ttl_seconds = "3600s"
  max_lease_ttl_seconds     = "10800s"
  ssh_path                  = "ssh"


}
