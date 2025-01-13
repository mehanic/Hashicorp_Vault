resource "vault_policy" "approle_policy" {
  provider = vault
  name     = var.approle_sign_policy_name
  policy   = format(local.approle_sign_policy_template, var.ca_mount_path)
}