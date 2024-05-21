variable "location" {
  type = string
  description = "Location of Server"
}

variable "resource_group_name" {
  type = string
  description = "Name of Resource Group"
}

variable "virtual_network_name" {
  type = string
  description = "Your Virtual Network Name"
}

variable "tags_name" {
  description = "Your TagName"
}

variable "virtual_network_address_space" {
  type = list(string)
  description = "Your Virtual Network Address Space"
}

variable "dns_servers" {
  type = list(string)
  description = "Your DNS Server Start IP"
}