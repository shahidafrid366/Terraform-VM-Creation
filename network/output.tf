output "resource_group_name" {
  value = azurerm_resource_group.module_rg.id
  description = "Resource Group Name"
}

output "subnet_id" {
  value = azurerm_subnet.module_subnet.id
  description = "The ID of the Subnet"
}

output "nic_id" {
  value       = azurerm_network_interface.tfrg3_nic.id
  description = "The ID of the Network Interface"
}

output "public_ip" {
  value = azurerm_public_ip.public_ip.ip_address
  description = "The public IP address of the network interface"
}
