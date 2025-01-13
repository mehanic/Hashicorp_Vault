module "terraform-vault-approle-auth" {
  source = "../../modules/terraform-vault-approle-auth"

  # Module dependency variable, can be left empty or updated as required
  module_depends_on = []

  # The mount path of the CA backend
  ca_mount_path = "ca_mount_path"

  # The mount path of the approle backend
  approle_auth_mount_path = "approle_ca_mount_path"

  # The name of the policy that allows the approle to sign certificates
  approle_sign_policy_name = "approle-sign-policy"

  # The name of the role for the approle authentication method
  role_name = "vault_approle"

}
