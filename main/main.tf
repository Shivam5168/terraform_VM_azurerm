provider "azurerm" {
  features {}
}

module "resource_group" {
  source              = "../resourceGroup"
  location            = "East US"
  resource_group_name = "ShivamTerraformDemo"
}

module "virtual_network" {
  source                        = "../VirtualNetwork"
  location                      = module.resource_group.location_output
  resource_group_name           = module.resource_group.name_output
  virtual_network_name          = "shivam-virtual-network"
  tags_name                     = "demo-virtual-network"
  virtual_network_address_space = ["10.0.0.0/16"]
  dns_servers                   = ["10.0.0.4", "10.0.0.5"]
}

module "subnet" {
  source = "../subnet"
  virtual_network_name = module.virtual_network.virtual_network_name_output
  resource_group_name = module.resource_group.name_output
  subnet_name = "shivam-subnet1"
  address_prefixes = ["10.0.1.0/24"]
}

module "public_ip" {
  source = "../public_ip"
  location                      = module.resource_group.location_output
  resource_group_name           = module.resource_group.name_output
  allocation_method = "dynamic"
  public_ip_name = "vm1_public_ip"
}

module "azurerm_network_interface" {
  source = "../azurerm_network_interface"
  location                      = module.resource_group.location_output
  resource_group_name           = module.resource_group.name_output
  network_interface_name = "vm1_NI"
  subnet_id = module.subnet.subnet_id_output
  public_id = module.public_ip.public_ip_id_output
  ip_configuration_name = "vm1_ip_config"
}

module "azurerm_network_security_group" {
  source = "../network_Security_Group"
  location                      = module.resource_group.location_output
  resource_group_name           = module.resource_group.name_output
  network_security_group_name = "vm1_network_security"
  security_rule = [
    {
      name                       = "HTTPAllowPort"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    },
    {
      name                       = "HTTPSAllowPort"
      priority                   = 110
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  ]
}

module "azurerm_network_interface_security_group_association" {
  source = "../nisg_association"
  network_interface_id = module.azurerm_network_interface.network_interface_ids_output
  network_security_group_id = module.azurerm_network_security_group.network_security_group_id_output
}

module "virtual_machine1" {
  source                      = "../VirtalMachine/VM1"
  location                    = module.resource_group.location_output
  resource_group_name         = module.resource_group.name_output
  network_interface_ids       = module.azurerm_network_interface.network_interface_ids_output
  virtual_machine_name        = "vm1"
  virtual_machine_size        = "Standard_DS1_v2"
  publisher                   = "Canonical"
  offer                       = "0001-com-ubuntu-server-focal"
  sku                         = "20_04-lts-gen2"
  vm_hostname                 = "SHIVAM PRADHAN HOST"
  vm_username                 = "Shivam"
  vm_password                 = "Shivam@9472052351"
  tags_name                   = "demo-virtual-network"

}