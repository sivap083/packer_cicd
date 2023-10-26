variable "region" {
  type    = string
  default = "eastus"
}

variable "size" {
  type    = string
  default = "t2.micro"
}

variable "rg-name" {
  type    = string
  default = "packer-demo"
}

variable "az_vm_name" {
  default = "pkr-vm"
}

variable "vnet_name" {
  default = "pkr-vnet"
}

variable "subnet_name" {
  default = "pkr-subnet"
}

variable "az_public_ip_name" {
  default = "pkr-image-public-ip"
}

variable "az_nsg_name" {
  default = "pkr-nsg"
}

variable "az_nic_name" {
  default = "pkr-nic"
}

