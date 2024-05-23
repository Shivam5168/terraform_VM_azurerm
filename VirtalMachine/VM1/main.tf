provider "azurerm" {
  features {}
}

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