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
    key = "phase2-nsg"
  }
}

provider "azurerm" {
  features {
    
  }
}

# NSG
resource "azurerm_network_security_group" "nsg" {
  name = var.nsg_name
  location = var.location
  resource_group_name = var.resource_group_name
}

# Network Security Rule - ssh
resource "azurerm_network_security_rule" "ssh" {
  name                        = "allow-ssh"
  priority                    = var.rule_priority_ssh
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  network_security_group_name = azurerm_network_security_group.nsg.name
  resource_group_name         = var.resource_group_name
}

# Network Security Rule - http
resource "azurerm_network_security_rule" "http" {
  name                        = "allow-http"
  priority                    = var.rule_priority_http
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  network_security_group_name = azurerm_network_security_group.nsg.name
  resource_group_name         = var.resource_group_name
}

# Call 'web' subnet resource 
data "azurerm_subnet" "web" {
  name = "subnet-web"
  virtual_network_name = "vnet-phase2"
  resource_group_name = "rg-phase2-networking"
}

# Connect subnet id to nsg 
resource "azurerm_subnet_network_security_group_association" "web_nsg_assoc" {
  subnet_id = data.azurerm_subnet.web.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}