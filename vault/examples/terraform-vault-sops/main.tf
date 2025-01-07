module "terraform-vault-sops" {
  source = "../../modules/terraform-vault-sops"


  # The Vault secret engine where secrets will be stored.
  secret_engine = "my-secrets-engine" # Change to the desired path (e.g., "my-secrets")

  # Folder path where sops encrypted files reside.
  folder_path = "../../modules/terraform-vault-sops/sops" # Change to the path where your SOPS files are located

  # Enable or disable key-value secret engine creation.
  create_secret_engine = true # Set to true to enable creation of the KV secret engine

}
//not worked correctly from example but working from modules