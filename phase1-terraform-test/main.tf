terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "~>3.0"
    }
  }
}
provider "azurerm" {
  features {}
}

#Create random number for storage account uniqueness
resource "random_integer" "rand" {
  min = 10000
  max = 99999
}

#Create resource group
resource "azurerm_resource_group" "rg" {
  name = "rg-terraform-foundation"
  location = "uksouth"
}

#Create storage account 
resource "azurerm_storage_account" "sa" {
    name = "stt${random_integer.rand.result}"
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
    account_tier = "Standard"
    account_replication_type = "LRS"
}