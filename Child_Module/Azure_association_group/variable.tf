variable "nic_nsg_assoc" {
  type = map(object({
    nic_key = string
    nsg_key = string
  }))
}

variable "nic_ids" {
  type = map(string)
}
variable "nsg_ids" {
  type = map(string)
}