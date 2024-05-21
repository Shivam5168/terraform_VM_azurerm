variable "location" {
  type = string
  description = "Location of Server"
}

variable "resource_group_name" {
  type = string
  description = "Name of Resource Group"
}

variable "public_ip_name" {
  type = string
  description = "Your Public IP Name"
}

variable "allocation_method" {
  type = string
  description = "Allocation Method Static or Dynamic"
}