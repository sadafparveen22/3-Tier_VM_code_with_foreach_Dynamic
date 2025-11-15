data "azurerm_subnet" "sub1" {
  for_each = var.nic
  name                 = each.value.sub_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "pip1" {
  for_each = var.nic
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}


resource "azurerm_network_interface" "tinku_nic" {
    for_each = var.nic
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  dynamic "ip_configuration"  {
    for_each = each.value.ip_configuration
    content {
      name                          = ip_configuration.value.name
    subnet_id                     = data.azurerm_subnet.sub1[each.key].id
    private_ip_address_allocation = ip_configuration.value.private_ip_address_allocation
    public_ip_address_id = data.azurerm_public_ip.pip1[each.key].id
    }
  }
}


output "nic_ids" {
  value = { for k, v in azurerm_network_interface.tinku_nic : k => v.id }
}
