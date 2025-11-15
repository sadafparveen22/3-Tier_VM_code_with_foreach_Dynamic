

variable"sub1"{
    type = map(object ({
    sub_name  = string
    vnet_name = string
    resource_group_name = string
    address_prefixes = list(string)
    }
    ))
}