terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "4.38.0"
    }
  }
  backend "azurerm" {
    storage_account_name = "rahulstg3"
    resource_group_name = "rahulrg"
    container_name = "hello"
    key  = "dev.terraform.terraform"    
  }
}

provider "azurerm" {
    features{}
    subscription_id = "4708a5a8-f77a-4e4c-a78b-41d72efd5e7e"
  
}