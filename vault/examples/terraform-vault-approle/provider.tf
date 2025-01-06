terraform {
  required_version = "1.10.0"

  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "3.8.0" # Adjust to the latest stable version as necessary
    }
  }
}

# data "terraform_remote_state" "approle" {
#   backend = "remote"

#   config = {
#     hostname     = var.tfe_endpoint
#     organization = var.approle_org_name
#     workspaces = {
#       name = var.approle_workspace_name
#     }
#   }
# }

# provider "vault" {
#   # $VAULT_ADDR should be configured with the endpoint where to reach Vault API.
#   # Or uncomment and update following line
#   # address = "https://<VAULT_API>"

#   namespace = var.namespace

#   # Authenticate using AppRole within our namespace
#   auth_login {
#     path = "${var.namespace}/auth/${var.app_role_mount_point}/login"
#     parameters = {
#       role_id   = data.terraform_remote_state.approle.outputs.role_id
#       secret_id = data.terraform_remote_state.approle.outputs.secret_id
#     }
#   }
# }

# # Remote Approle state configuration
# variable "tfe_endpoint" {
#   description = "TFE API Endpoint without https://"
#   default     = "replicated.yet.org"
# }

# variable "approle_org_name" {
#   description = "TFE Org where to find approle workspace"
#   default     = "yet"
# }

# variable "approle_workspace_name" {
#   description = "TFE Workspace Approle name"
#   default     = "api-vault-approle"
# }

# # Namespace where to onboard our Application
# variable "namespace" {
#   description = "namespace where all work will happen"
#   default     = "research"
# }
