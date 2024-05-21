
variable "location" {
  type = string
  description = "Location of Server"
}

variable "resource_group_name" {
  type = string
  description = "Name of Resource Group"
}

variable "network_security_group_name" {
  type = string
  description = "Your Network Security Group Name"  
}

variable "security_rule" {
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))   
}
# variable "security_rule_name" {
#    type = string
#   description = "Your Security Rule Name"  
# }

# variable "security_rule_priority" {
#   type = number
#   description = "Your Security Rule Priority" 
# }

# variable "security_rule_direction"{
#   type = string
#   description = "Your Security Rule Direction" 
# }               
# variable "security_rule_access"{
#   type = string
#   description = "Your Security Rule Access" 
# }                    
# variable "security_rule_protocol"{
#   type = string
#   description = "Your Security Rule Protocol" 
# }                   
# variable "security_rule_source_port_range"{
#   type = string
#   description = "Your Security Rule Range" 
# }          
# variable "security_rule_destination_port_range"{
#   type = string
#   description = "Your Security Rule Destination Port Range" 
# }  
# variable "security_rule_source_address_prefix"{
#   type = string
#   description = "Your Security Rule Source Address Prefix" 
# }     
# variable "security_rule_destination_address_prefix"{
#   type = string
#   description = "Your Security Rule Destination Address Prefix" 
# }