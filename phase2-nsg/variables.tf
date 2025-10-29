variable "resource_group_name" {
  description = "Name of NSG resource group"
  type        = string
}

variable "location" {
  description = "Azure reigon for deployment"
  type        = string
  default     = "uksouth"
}

variable "nsg_name" {
  description = "NSG name"
  type        = string
}

variable "rule_priority_ssh" {
  description = "Priority value for inbound rule (100-4096, lower = higher priority)"
  type = number
  default = 100
}

variable "rule_priority_http" {
  description = "Priority value for inbound rule (100-4096, lower = higher priority)"
  type = number
  default = 200
}