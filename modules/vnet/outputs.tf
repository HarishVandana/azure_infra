output "vnet_name" {
  description = "The name of the virtual network"
  value       = azurerm_virtual_network.vnet.name
}

output "subnet_id" {
  description = "The ID of the subnet created in the virtual network"
  value       = azurerm_subnet.subnet.id
}

output "vnet_id" {
  description = "The ID of the virtual network"
  value       = azurerm_virtual_network.vnet.id
}
