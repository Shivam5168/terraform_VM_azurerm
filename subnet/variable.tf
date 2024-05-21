variable "resource_group_name" {
    type = string
  description = "Your Resource Group Name"
}

variable "virtual_network_name" {
    type = string
   description = "Your Virtual Network Name"
}

variable "subnet_name" {
  type = string
  description = "Your Subnet Name"
}

variable "address_prefixes" {
    type = list(string)
  description = "Your Address Prefix"
}