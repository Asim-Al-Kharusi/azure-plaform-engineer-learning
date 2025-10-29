variable "project_prefix" {
  description = "Prefix for naming resoruces"
  type = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group"
  type = string
}

variable "location" {
  description = "Azure Reigon for all resources"
  type = string
  default = "uksouth"
}

variable "storage_account_tier" {
  description = "Storage account performance tier"
  type = string
  default = "Standard"
}

variable "storage_replication_type" {
  description = "Storage replication type"
  type = string
  default = "LRS"
}