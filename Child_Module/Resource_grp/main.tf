resource "azurerm_resource_group" "tinku" {
for_each = var.rgs
    name = each.value.rg_name
    location = each.value.location
  
}