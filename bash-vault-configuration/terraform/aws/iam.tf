# Azure Location and Resource Group
variable "az_location" {
  description = "The Azure region where resources will be deployed"
  default     = "eastus"
}

variable "az_resource_group_name" {
  description = "The name of the Azure resource group"
  default     = "vault-demo"
}

# Azure Credentials (use environment variables or secure storage for sensitive information)
variable "az_subscription" {
  description = "The Azure Subscription ID"
  type        = string
  sensitive   = true
}

variable "az_client_id" {
  description = "The Azure Client ID"
  type        = string
  sensitive   = true
}

variable "az_tenant_id" {
  description = "The Azure Tenant ID"
  type        = string
  sensitive   = true
}

variable "az_client_secret" {
  description = "The Azure Client Secret"
  type        = string
  sensitive   = true
}

# Virtual Network Settings
variable "vnet_cidr" {
  description = "The CIDR block for the Virtual Network"
  default     = "10.0.1.0/22"
}

# Consul Information
variable "consul_version" {
  description = "The version of Consul to install"
  default     = "1.4.0"
}

variable "consul_key" {
  description = "The key for encrypting Consul communication"
  type        = string
  sensitive   = true
  default     = "BgVgz1dyqCP1d9fyDGwnPw=="
}
