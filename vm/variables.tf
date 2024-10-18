variable "tfvm" {
  description = "Enter the Virtual Machine Name"
  type        = string
}

variable "admin_username" {
  description = "Enter The Admin Username"
  type        = string
}

variable "admin_password" {
  description = "Enter The Admin Password"
  type        = string
}

variable "location" {
  description = "Enter the VM location to store"
  type        = string
}

variable "resource_group_name" {
  description = "Enter the Resource Group Name"
  type        = string
}

variable "vm_size" {
  description = "Enter the VM size"
  type        = string
}

variable "nic_id" {
  description = "Enter the Network Interface ID"
  type        = string
}

variable "os_disk_caching" {
  description = "Enter the OS Disk Caching"
  type        = string
}

variable "os_disk_storage_account_type" {
  description = "Enter the Disk Storage Account Type"
  type        = string
}

variable "vm_publisher" {
  description = "Enter The VM Publisher"
  type        = string
}

variable "vm_offer" {
  description = "Enter the VM Offer"
  type        = string
}

variable "vm_sku" {
  description = "Enter the VM SKU"
  type        = string
}

variable "vm_version" {
  description = "Enter the Version"
  type        = string
}

