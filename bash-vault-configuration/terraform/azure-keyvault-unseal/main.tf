provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "vault" {
  name     = "${var.environment}-vault-rg"
  location = var.location

  tags = {
    environment = var.environment
  }
}

resource "random_id" "keyvault" {
  byte_length = 4
}

data "azurerm_client_config" "current" {}

data "azuread_service_principal" "vault" {
  application_id = var.client_id
}

resource "azurerm_key_vault" "vault" {
  name                = "${var.environment}-vault-${random_id.keyvault.hex}"
  location            = azurerm_resource_group.vault.location
  resource_group_name = azurerm_resource_group.vault.name
  tenant_id           = var.tenant_id
  enabled_for_deployment = true
  sku_name            = "standard"

  tags = {
    environment = var.environment
  }

  access_policy {
    tenant_id = var.tenant_id
    object_id = data.azuread_service_principal.vault.object_id
    key_permissions = ["Get", "WrapKey", "UnwrapKey"]
  }

  access_policy {
    tenant_id = var.tenant_id
    object_id = data.azurerm_client_config.current.object_id
    key_permissions = ["Get", "List", "Create", "Delete", "Update"]
  }

  network_acls {
    default_action = "Allow"
    bypass         = "AzureServices"
  }
}

resource "azurerm_key_vault_key" "generated" {
  name         = var.key_name
  key_vault_id = azurerm_key_vault.vault.id
  key_type     = "RSA"
  key_size     = 2048
  key_opts = ["wrapKey", "unwrapKey"]
}

output "key_vault_name" {
  value = azurerm_key_vault.vault.name
}

# Define the list of security rules dynamically
locals {
  security_rules = [
    {
      name                       = "SSH"
      priority                   = 1001
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    },
    {
      name                       = "Vault"
      priority                   = 1002
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "8200"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    },
    {
      name                       = "Consul"
      priority                   = 1003
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "8500"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  ]
}

resource "azurerm_network_security_group" "tf_nsg" {
  name                = "nsg-${random_id.keyvault.hex}"
  location            = var.location
  resource_group_name = azurerm_resource_group.vault.name

  dynamic "security_rule" {
    for_each = local.security_rules
    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = security_rule.value.source_port_range
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = security_rule.value.source_address_prefix
      destination_address_prefix = security_rule.value.destination_address_prefix
    }
  }

  tags = {
    environment = "${var.environment}-${random_id.keyvault.hex}"
  }
}

resource "azurerm_network_interface" "tf_nic" {
  name                      = "nic-${random_id.keyvault.hex}"
  location                  = var.location
  resource_group_name       = azurerm_resource_group.vault.name

  ip_configuration {
    name                          = "nic-${random_id.keyvault.hex}"
    subnet_id                     = azurerm_subnet.tf_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.tf_publicip.id
  }

  tags = {
    environment = "${var.environment}-${random_id.keyvault.hex}"
  }
}

resource "azurerm_network_interface_security_group_association" "tf_nisga" {
  network_interface_id      = azurerm_network_interface.tf_nic.id
  network_security_group_id = azurerm_network_security_group.tf_nsg.id
}

resource "azurerm_storage_account" "tf_storageaccount" {
  name                     = "sa${random_id.keyvault.hex}"
  resource_group_name      = azurerm_resource_group.vault.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "${var.environment}-${random_id.keyvault.hex}"
  }
}

data "template_file" "setup" {
  template = file("${path.module}/setup.tpl")

  vars = {
    resource_group_name = "${var.environment}-vault-rg"
    vm_name             = var.vm_name
    vault_version       = var.vault_version
    tenant_id           = var.tenant_id
    subscription_id     = var.subscription_id
    client_id           = var.client_id
    client_secret       = var.client_secret
    vault_name          = azurerm_key_vault.vault.name
    key_name            = var.key_name
  }
}

# Create virtual machine
resource "azurerm_linux_virtual_machine" "tf_vm" {
  name                  = var.vm_name
  location              = var.location
  resource_group_name   = azurerm_resource_group.vault.name
  network_interface_ids = [azurerm_network_interface.tf_nic.id]
  size                  = "Standard_DS1_v2"
  custom_data           = base64encode(data.template_file.setup.rendered)
  computer_name         = var.vm_name
  admin_username        = "azureuser"

  admin_ssh_key {
    username   = "azureuser"
    public_key = var.public_key
  }

  identity {
    type = "SystemAssigned"
  }

  os_disk {
    name                 = "${var.vm_name}-os"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.tf_storageaccount.primary_blob_endpoint
  }

  tags = {
    environment = "${var.environment}-${random_id.keyvault.hex}"
  }
}

data "azurerm_public_ip" "tf_publicip" {
  name                = azurerm_public_ip.tf_publicip.name
  resource_group_name = azurerm_linux_virtual_machine.tf_vm.resource_group_name
}

output "ip" {
  value = data.azurerm_public_ip.tf_publicip.ip_address
}

output "ssh-addr" {
  value = <<SSH

    Connect to your virtual machine via SSH:

    $ ssh azureuser@${data.azurerm_public_ip.tf_publicip.ip_address}

SSH
}
