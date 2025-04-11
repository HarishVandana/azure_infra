provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix}-rg-${var.env}-${var.location}"
  location = var.location
  tags     = var.tags
}

module "vnet" {
  source              = "../../modules/vnet"
  prefix              = var.prefix
  env                 = var.env
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = var.tags
}

resource "azurerm_windows_virtual_machine" "vm" {
  name                = "${var.prefix}-vm-${var.env}-${var.location}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  network_interface_ids = [
    module.vnet.subnet_id
  ]
  size                = "Standard_B2s"
  admin_username      = "azureuser"
  admin_password      = "P@ssword1234!" # Avoid hardcoding in production!
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
  tags = var.tags
}

resource "azurerm_storage_account" "devsa" {
  name                     = "${var.prefix}devsa${random_id.storage.hex}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = var.tags
}

resource "random_id" "storage" {
  byte_length = 4
}
