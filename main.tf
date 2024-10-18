module "network" {
  source                    = "./network"
  resource_group_name       = "tfrg3"
  location                  = "Central India"
  vnet_name                 = "tfrg3vnet"
  module_vnet_address_space = "10.0.0.0/16"
  subnet_name               = "tfrg3subnet"
  nic_name                  = "tfrg3nic"
  subnet_prefix             = "10.0.0.0/24"
}

module "vm" {
  source = "./vm"
  tfvm = "tfrg3virtualname"
  admin_password = "server@12345"
  admin_username = "tfrg3vm"
  location = "Central India"
  resource_group_name = "tfrg3"
  vm_size = "Standard_DS1_v2"
  nic_id = module.network.nic_id
  os_disk_caching = "ReadWrite"
  os_disk_storage_account_type = "Standard_LRS"
  vm_publisher = "Canonical"
  vm_offer = "UbuntuServer"
  vm_sku = "18.04-LTS"
  vm_version = "latest"
}
