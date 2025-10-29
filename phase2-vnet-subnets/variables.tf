variable "location" {
  description = "Azure region to deploy resources"
  type        = string
  default     = "uksouth"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
}

variable "vnet_address_space" {
    description = "Address space for the virtual network"
    type        = string
}

variable "web_subnet_name" {
  description = "Name of the web subnet"
  type        = string
}

variable "web_subnet_prefix" {
  description = "CIDR block for the web subnet"
  type        = string
}

variable "data_subnet_name" {
  description = "Name of the data subnet"
  type        = string
}

variable "data_subnet_prefix" {
  description = "CIDR block for the data subnet"
  type        = string
}
