variable"rg1"{}
variable"vnet_vm"{
    type = map(object ({

    vnet_name = string
    resource_group_name = string
    location = string
    address_space = list(string)
    }
    ))
}

variable"sub1_vm"{}
variable"pip1"{}

variable "nic1" {}
variable "vms1" {}
variable "key_vault" {}
variable "nsg1" {}
variable "nic_nsg_assoc" {}
  
