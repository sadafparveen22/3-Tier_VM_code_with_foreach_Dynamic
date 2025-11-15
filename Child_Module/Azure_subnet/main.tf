resource "azurerm_subnet" "tinku_sub1" {
    for_each = var.sub1
  name = each.value.sub_name
  resource_group_name = each.value.resource_group_name
  virtual_network_name = each.value.vnet_name
  address_prefixes = each.value.address_prefixes
}