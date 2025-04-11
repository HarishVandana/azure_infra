output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "vnet_name" {
  value = module.vnet.vnet_name
}

output "subnet_id" {
  value = module.vnet.subnet_id
}

output "vm_name" {
  value = azurerm_windows_virtual_machine.vm.name
}

output "storage_account_name" {
  value = azurerm_storage_account.devsa.name
}
