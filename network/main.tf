resource "azurerm_resource_group" "module_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "module_vnet" {
  name                = var.vnet_name
  location            = azurerm_resource_group.module_rg.location
  resource_group_name = azurerm_resource_group.module_rg.name
  address_space       = [var.module_vnet_address_space]
}

resource "azurerm_subnet" "module_subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.module_rg.name
  virtual_network_name = azurerm_virtual_network.module_vnet.name
  address_prefixes     = [var.subnet_prefix]
}

resource "azurerm_public_ip" "public_ip" {
  name                = "${var.nic_name}-public-ip"
  location            = azurerm_resource_group.module_rg.location
  resource_group_name = azurerm_resource_group.module_rg.name
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "tfrg3_nic" {
  name                = var.nic_name
  location            = azurerm_resource_group.module_rg.location
  resource_group_name = azurerm_resource_group.module_rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.module_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }
}

resource "azurerm_network_security_group" "tfrg3_nsg" {
  name                = "${var.resource_group_name}-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_network_security_rule" "allow_ssh" {
  name                        = "Allow-SSH"
  network_security_group_name = azurerm_network_security_group.tfrg3_nsg.name
  priority                    = 1000
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.module_rg.name
}

resource "azurerm_network_interface_security_group_association" "module_nic" {
  network_interface_id      = azurerm_network_interface.tfrg3_nic.id
  network_security_group_id = azurerm_network_security_group.tfrg3_nsg.id
}


