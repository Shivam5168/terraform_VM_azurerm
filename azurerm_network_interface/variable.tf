variable "location" {
  type = string
  description = "Location of Server"
}

variable "resource_group_name" {
  type = string
  description = "Name of Resource Group"
}

variable "network_interface_name" {
  type = string
  description = "Your Network INterface Name"
}

variable "ip_configuration_name" {
  type = string
  description = "Your IP Configuration Name"
}

variable "subnet_id" {
  description = "Your Subnet Id"
}

variable "public_id" {
  description = "Your Public Id"
}