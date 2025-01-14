
resource "vault_kv_secret_v2" "ssh" {
  depends_on          = [vault_mount.laboratory]
  count               = (var.ssh_keys != null) ? 1 : 0
  mount               = vault_mount.laboratory.path
  name                = "ssh"
  cas                 = 1
  delete_all_versions = true
  data_json = jsonencode(
    {
      for key, value in var.ssh_keys : key => value
    }
  )
  custom_metadata {
    max_versions = 5
  }
}

resource "vault_kv_secret_v2" "pve_auth_user_password" {
  depends_on          = [vault_mount.laboratory]
  count               = (var.pve_auth_keys_userpass != null) ? 1 : 0
  mount               = vault_mount.laboratory.path
  name                = "proxmox/auth/userpass"
  cas                 = 1
  delete_all_versions = true
  data_json = jsonencode(
    {
      for key, value in var.pve_auth_keys_userpass : key => value
    }
  )
  custom_metadata {
    max_versions = 5
  }
}

resource "vault_kv_secret_v2" "pve_auth_user_api_token" {
  depends_on          = [vault_mount.laboratory]
  count               = (var.pve_auth_keys_api != null) ? 1 : 0
  mount               = vault_mount.laboratory.path
  name                = "proxmox/auth/api"
  cas                 = 1
  delete_all_versions = true
  data_json = jsonencode(
    {
      for key, value in var.pve_auth_keys_api : key => value
    }
  )
  custom_metadata {
    max_versions = 5
  }
}
