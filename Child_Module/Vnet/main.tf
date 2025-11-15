resource "azurerm_virtual_network" "tinku_vnet" {
    for_each = var.vnet1
    name  = each.value.vnet_name
    resource_group_name = each.value.resource_group_name
    location = each.value.location
    address_space =each.value.address_space
  
}