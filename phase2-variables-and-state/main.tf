terraform {
  backend "azurerm" {
    resource_group_name = "rg-tfstate"
    storage_account_name = "sttfstate07693"
    container_name = "tfstate"
    key = "phase2-terraform.tfstate"
  }
}
terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {
    
  }
}

resource "azurerm_resource_group" "rg" {
  name  = var.resource_group_name
  location = var.location
}

resource "random_integer" "rand" {
  min = 100000
  max = 999999
}

resource "azurerm_storage_account" "sa" {
  name = "st${var.project_prefix}${random_integer.rand.result}"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  account_tier =  var.storage_account_tier
  account_replication_type = var.storage_replication_type
}

