variable "nic" {
    type = map(object ({
  nic_name                = string
  location            = string
  resource_group_name = string
  sub_name = string
  vnet_name = string
  pip_name = string
  ip_configuration = map(object({
    name = string   
    private_ip_address_allocation = string
    
  }))
    }))
    
}

