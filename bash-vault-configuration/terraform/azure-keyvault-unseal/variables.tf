# ---------------------------
# Azure Key Vault
# ---------------------------
variable "tenant_id" {
  description = "The Azure Tenant ID"
  default     = ""
}

variable "key_name" {
  description = "The name of the Key Vault key to be generated"
  default     = "generated-key"
}

variable "location" {
  description = "The Azure region to deploy the Key Vault"
  default     = "eastus"
}

variable "environment" {
  description = "Environment tag used to label resources"
  default     = "learn"
}

# ---------------------------
# Virtual Machine
# ---------------------------
variable "public_key" {
  description = "Public SSH key to access the VM"
  default     = ""
}

variable "subscription_id" {
  description = "Azure Subscription ID"
  default     = ""
}

variable "client_id" {
  description = "Azure Client ID (App Registration)"
  default     = ""
}

variable "client_secret" {
  description = "Azure Client Secret (App Registration)"
  default     = ""
}

variable "vm_name" {
  description = "The name of the virtual machine to be created"
  default     = "azure-auth-demo-vm"
}

variable "vault_version" {
  description = "The version of Vault to be installed on the VM (use 'apt-cache madison vault' to find available versions)"
  default     = "1.9.4"
}

variable "resource_group_name" {
  description = "The name of the resource group to be created"
  default     = "vault-demo-azure-auth"
}

# ---------------------------
# Network Settings
# ---------------------------
variable "network" {
  description = "Network configuration for the virtual machine"
  type = object({
    vnet_name   = string
    subnet_name = string
    nsg_name    = string
    public_ip   = bool
  })
  default = {
    vnet_name   = "vault-vnet"
    subnet_name = "vault-subnet"
    nsg_name    = "vault-nsg"
    public_ip   = true
  }
}

# ---------------------------
# Tagging and Metadata
# ---------------------------
variable "tags" {
  description = "Tags to be applied to all resources"
  type = map(string)
  default = {
    environment = "learn"
    project     = "vault-auth-demo"
  }
}

# ---------------------------
# Storage Settings
# ---------------------------
variable "storage_account" {
  description = "Configuration for the storage account"
  type = object({
    name                     = string
    account_tier              = string
    account_replication_type = string
  })
  default = {
    name                     = "vaultsa"
    account_tier              = "Standard"
    account_replication_type = "LRS"
  }
}
