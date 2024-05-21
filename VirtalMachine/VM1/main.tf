provider "azurerm" {
  features {}
}

# data "azurerm_subnet" "internal-subnet" {
#   name                 = var.subnet_name
#   resource_group_name  = var.resource_group_name
#   virtual_network_name = var.virtual_network_name
# }

# resource "azurerm_public_ip" "my_terraform_public_ip" {
#   name                = var.public_ip_name
#   location            = var.location
#   resource_group_name = var.resource_group_name
#   allocation_method   = "Dynamic"
# }


# resource "azurerm_network_interface" "internal-network" {
#   name                = var.network_interface_name
#   location            = var.location
#   resource_group_name = var.resource_group_name

#   ip_configuration {
#     name                          = var.ip_configuration_name
#     subnet_id                     = "${data.azurerm_subnet.internal-subnet.id}"
#     private_ip_address_allocation = "Dynamic"
#     public_ip_address_id = azurerm_public_ip.my_terraform_public_ip.id
#   }
# }

# resource "azurerm_network_security_group" "nsg" {
#   name                = var.network_security_group_name
#   location            = var.location
#   resource_group_name = var.resource_group_name

#   security_rule {
#     name                       = "allow_ssh_sg"
#     priority                   = 100
#     direction                  = "Inbound"
#     access                     = "Allow"
#     protocol                   = "Tcp"
#     source_port_range          = "*"
#     destination_port_range     = "22"
#     source_address_prefix      = "*"
#     destination_address_prefix = "*"
#   }
#   security_rule {
#     name                       = "HTTP"
#     priority                   = 110
#     direction                  = "Inbound"
#     access                     = "Allow"
#     protocol                   = "Tcp"
#     source_port_range          = "*"
#     destination_port_range     = "80"
#     source_address_prefix      = "*"
#     destination_address_prefix = "*"
#   }
# }

# resource "azurerm_network_interface_security_group_association" "association" {
#   network_interface_id      = azurerm_network_interface.internal-network.id
#   network_security_group_id = azurerm_network_security_group.nsg.id
# }

resource "azurerm_virtual_machine" "main" {
  name                  = var.virtual_machine_name
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [var.network_interface_ids]
  vm_size               = var.virtual_machine_size

  storage_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = var.vm_hostname
    admin_username = var.vm_username
    admin_password = var.vm_password
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = var.tags_name
  }
}