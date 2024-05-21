provider "azurerm" {
  features {}
}

resource "azurerm_public_ip" "my_terraform_public_ip" {
  name                = var.public_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
}