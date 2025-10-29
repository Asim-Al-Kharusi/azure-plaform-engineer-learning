output "resource_group_name" {
  description = "The name of the resource group created by Terraform"
  value = azurerm_resource_group.rg.name
}

output "storage_account_name" {
  description = "The name of the storage acount created by Terraform"
  value = azurerm_storage_account.sa.name
}

output "storage_account_id" {
  description = "Storage account ID"
  value = azurerm_storage_account.sa.id
}
