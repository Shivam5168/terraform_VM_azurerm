provider "azurerm" {
  features {}
}

resource "azurerm_virtual_network" "shivam-vnet" {
  name                = var.virtual_network_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.virtual_network_address_space
  dns_servers         = var.dns_servers
}