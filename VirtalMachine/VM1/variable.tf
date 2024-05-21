variable "location" {
  type = string
  description = "Location of Server"
}

variable "resource_group_name" {
  type = string
  description = "Name of Resource Group"
}

variable "network_interface_ids" {
  type = string
  description = "Your Network Interface Ids"  
}

variable "virtual_machine_name" {
  type = string
  description = "Your Virtual Network Name" 
}

variable "virtual_machine_size" {
  type = string
  description = "Your Virtual Machine Size"
}

variable "publisher" {
  type = string
  description = "Your Publisher"
}

variable "offer" {
  type = string
  description = "Your Image"
}

variable "sku" {
  type = string
  description = "Your SKU Name"
}

variable "vm_hostname" {
  type = string
  description = "Your Virtual Machine Host Name"
}

variable "vm_username" {
  type = string
  description = "Your Virtual Machine UserName"
}

variable "vm_password" {
  type = string
  description = "Your Virtual Machine Password"
}

variable "tags_name" {
  type = string
  description = "Your TagName"
}

