output "vm_id" {
  value = azurerm_linux_virtual_machine.tf_vm.id
  description = "Virtual Machine Details are :"
}

output "vm_ip" {
  value = azurerm_linux_virtual_machine.tf_vm.private_ip_address
  description = "IP details for Virtual Machine :"
}
