variable "resource_group_name" {
  description = "Enter Resource Group Name"
  type        = string
}

variable "location" {
  description = "Enter Location for RG"
  type        = string
}

variable "vnet_name" {
  description = "Enter Name For VNET"
  type        = string
}

variable "module_vnet_address_space" {
  description = "Enter Address Space for VNET"
  type        = string
}

variable "subnet_name" {
  description = "Enter Name for SUBNET Name"
  type        = string
}

variable "subnet_prefix" {
  description = "Enter the Address Range for Subnet"
  type        = string
}

variable "nic_name" {
  description = "Enter the NIC name"
  type        = string
}

