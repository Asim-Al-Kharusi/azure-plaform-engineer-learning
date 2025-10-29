output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

output "web_subnet_id" {
  value = azurerm_subnet.web.id
}

output "data_subnet_id" {
  value = azurerm_subnet.data.id
}

