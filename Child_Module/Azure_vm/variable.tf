variable"vms"{
   type  = map(object({
     vm_name    = string
  resource_group_name = string
  location            = string
  size                = string
#   admin_username      = string
#   admin_password = string
    kv_name              = string
#   network_interface_ids = list(string)

  nic_key             = string
  os_disk = map(object({
    caching              = string
    storage_account_type = string
  }))
  source_image_reference = map(object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  }))
   }))


}

variable "nic_ids" {
  description = "Map of NIC IDs coming from the NIC module"
  type        = map(string)
}
# variable "tinku" {
#     type = map(object({
#         for_each            = string
#   name                = string
#   resource_group_name = string
#     }))
# }