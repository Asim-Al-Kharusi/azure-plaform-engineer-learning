terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "~> 4.0"
    }
  }
  backend "azurerm" {
    resource_group_name = "rg-tfstate"
    storage_account_name = "sttfstate07693"
    container_name = "tfstate"
    key = "phase2-vnets-subnets.tfstate"
  }
}

provider "azurerm" {
  features {
    
  }
}

#Resource Group 
resource "azurerm_resource_group" "rg" {
  name = var.resource_group_name
  location =  var.location
}

#Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name = var.vnet_name
  address_space = [var.vnet_address_space]
  location  = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

#Subnet 1 - Web
resource "azurerm_subnet" "web" {
  name = var.web_subnet_name
  resource_group_name = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = [var.web_subnet_prefix]
}

#Subnet 2 - Data
resource "azurerm_subnet" "data" {
  name = var.data_subnet_name
  resource_group_name = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = [var.data_subnet_prefix]
}