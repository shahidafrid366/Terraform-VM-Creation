resource "azurerm_linux_virtual_machine" "tf_vm" {
  name                            = var.tfvm
  admin_username                  = var.admin_username
  admin_password                  = var.admin_password
  location                        = var.location
  resource_group_name             = var.resource_group_name
  size                            = var.vm_size
  network_interface_ids           = [var.nic_id]
  disable_password_authentication = false

  os_disk {
    caching              = var.os_disk_caching
    storage_account_type = var.os_disk_storage_account_type
  }

  source_image_reference {
    publisher = var.vm_publisher
    offer     = var.vm_offer
    sku       = var.vm_sku
    version   = var.vm_version
  }
}

