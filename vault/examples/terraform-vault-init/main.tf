module "terraform-vault-init" {
  source = "../../modules/terraform-vault-init"
  # Vault address (provide your actual Vault URL)
  #vault_addr = "https://vault.example.com:8200"

  # Admin password for authentication (ensure sensitive handling)
  admin_password = "qwerty123"

  # DevOps password for authentication (ensure sensitive handling)
  devops_password = "qwerty123"

  # IP whitelist (replace with your actual IPs)
  ip_whitelist = [
    "192.168.1.100", # Example IP, replace with your own
    "10.0.0.1"
  ]

  # SSH keys (replace with actual SSH key pairs)
  ssh_keys = {
    "key_name_1" = "ssh-rsa AAAAB3Nza...generated_key_1"
    "key_name_2" = "ssh-rsa AAAAB3Nza...generated_key_2"
  }

  # Proxmox userpass authentication (replace with valid credentials)
  pve_auth_keys_userpass = {
    "user1" = "password1"
    "user2" = "password2"
  }

  # Proxmox API token authentication (replace with valid tokens)
  pve_auth_keys_api = {
    "api_user1" = "token1"
    "api_user2" = "token2"
  }

}