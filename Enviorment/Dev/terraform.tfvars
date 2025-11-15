rg1 = {
    rg_vm = {
        rg_name = "tinku1"
        location = "west us"
    
    }   
}

vnet_vm = {
    tinku_vnet1 = {
     vnet_name  = "tinku_vnet"
    resource_group_name = "tinku1"
    location = "west us"
    address_space =["10.0.0.0/16"]

    }
}

sub1_vm = {
    front_sub = {
     sub_name  = "tinku_sub"
    vnet_name = "tinku_vnet"
    resource_group_name = "tinku1"
    address_prefixes = ["10.0.2.0/28"]
    }
    back_sub = {
     sub_name  = "pinku_sub"
    vnet_name = "tinku_vnet"
    resource_group_name = "tinku1"
    address_prefixes = ["10.0.1.0/28"]
    }
    }


pip1 = {
    front_pip = {
  pip_name = "tinku_pip"
  resource_group_name = "tinku1"
  location = "west us"
  allocation_method = "Static"

    }

    back_pip = {
      pip_name = "back_pip"
  resource_group_name = "tinku1"
  location = "west us"
  allocation_method = "Static"
    }
}

nic1 = {
  front_nic = {
  nic_name                = "front1_nic"
  location            = "west us"
  resource_group_name = "tinku1"
  sub_name = "tinku_sub"
  vnet_name = "tinku_vnet"
  pip_name = "tinku_pip"

  ip_configuration = {
    name = {
        name           = "internal"  
    private_ip_address_allocation = "Dynamic"
    }
    } 
    }

    back_nic = {
      
     nic_name                = "back1_nic"
  location            = "west us"
  resource_group_name = "tinku1"
   sub_name = "pinku_sub"
  vnet_name = "tinku_vnet"
  pip_name = "back_pip"
   ip_configuration = {
    back = {
    name           = "internal"  
    private_ip_address_allocation = "Dynamic"
    }
    }
      }
}


nsg1 = {

    front_nsg = {
         nsg_name                = "front_nsg"
       location            = "west us"
  resource_group_name = "tinku1"
  security_rule ={
   rule = {
    name                       = "front123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
   }
    
  }
    }
    back_nsg = {
         nsg_name                = "back_nsg"
       location            = "west us"
  resource_group_name = "tinku1"
  security_rule ={
   rule2 = {
    name                       = "back123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
   }
    
  }
    }
}

nic_nsg_assoc = {
  assoc1 = {
    nic_key = "front_nic"
    nsg_key = "front_nsg"
  }
 assco2 = {
    nic_key = "back_nic"
    nsg_key = "back_nsg"
 }
}

vms1 = {
    front = {
 vm_name                = "frontvm"
  resource_group_name = "tinku1"
  location            = "west us"
  size                = "Standard_B2ms"
  nic_key             = "front_nic"
  kv_name              = "tinku-key"     
os_disk  = {
    os = {
     caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    }
 }
source_image_reference = {
    image = {
publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
    }     
    }
    
     
  } 
   back_vm = {
      vm_name                = "backvm"
  resource_group_name = "tinku1"
  location            = "west us"
  size                = "Standard_B2ms"
  nic_key             = "front_nic"
  kv_name              = "tinku-key"     
os_disk  = {
    os = {
     caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    }
 }
source_image_reference = {
    image = {
publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
    }     
    } 
    }
}

key_vault = {
    key1 = {
         key_name = "tinku-key"
  location    = "west us"
  resource_group_name = "tinku1"
    }
}


