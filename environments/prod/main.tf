# environments/prod/main.tf for testing
provider "azurerm" {
  features {}
  subscription_id = "140e007d-58bb-49d0-b585-2045e4132205"
}

module "vnet" {
  source              = "../../modules/vnet"
  vnet_name           = "vnet-prod-eastus"
  resource_group_name = "sanofi-prod-rg"
  location            = "eastus"
  address_space       = ["10.0.0.0/16"]
  subnets = {
    web     = ["10.0.1.0/24"]
    backend = ["10.0.2.0/24"]
  }
  tags = {
    env    = "prod"
    region = "eastus"
  }
}
