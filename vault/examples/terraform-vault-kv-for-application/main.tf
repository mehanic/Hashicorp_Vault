module "terraform-vault-kv-for-application" {
  source         = "../../modules/terraform-vault-kv-for-application"
  # Name of the Application to be onboarded
appname = "golang-application"

# List of environments where the application will be deployed
enviroments = ["prod", "dev"]

# Path of AppRole auth backend
approle_path = "approle"

# Enable AppRole roles for the application
enable_approle = true

}
