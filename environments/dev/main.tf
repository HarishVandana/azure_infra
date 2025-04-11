# environments/dev/main.tf for dev environment
provider "azurerm" {
  features {}
  subscription_id = "140e007d-58bb-49d0-b585-2045e4132205"
}

module "vnet" {
  source              = "../../modules/vnet"
  vnet_name           = "vnet-dev-eastus"
  resource_group_name = "sanofi-dev-rg"
  location            = "eastus"
  address_space       = ["10.0.0.0/16"]
  subnets = {
    web     = ["10.0.1.0/24"]
    backend = ["10.0.2.0/24"]
  }
  tags = {
    env    = "dev"
    region = "eastus"
  }
}
