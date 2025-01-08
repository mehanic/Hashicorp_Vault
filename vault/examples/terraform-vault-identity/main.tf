module "terraform-vault-identity" {
  source           = "../../modules/terraform-vault-identity"
  application_name = "development-secret"

  env = "dev"

  service = "platform"

  # Replace the mount_accessor value with your actual Vault approle accessor if different.
  mount_accessor = "auth_approle_6d1f132c"

  # Replace the identity_group_id value with the correct ID if necessary.
  identity_group_id = "development"


}