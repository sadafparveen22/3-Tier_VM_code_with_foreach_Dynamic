module "rg1" {
    source = "../../Child_Module/Resource_grp"
    rgs = var.rg1

}

module"vnet" {
    depends_on = [ module.rg1 ]
  source = "../../Child_Module/Vnet"
  vnet1 = var.vnet_vm
}

module "tinku_sub1" {
    depends_on = [module.rg1, module.vnet ]
    source = "../../Child_Module/Azure_subnet"
    sub1 = var.sub1_vm
 
}

module "pip1" {
    depends_on = [ module.rg1 ]
    source = "../../Child_Module/Azure_pip"
    pip1 = var.pip1
  
}

module "nic" {
    depends_on = [ module.rg1,module.tinku_sub1,module.vnet,module.pip1 ]
    source = "../../Child_Module/azure_nic"
    nic = var.nic1
  
}

module "nsg"{
    depends_on = [ module.rg1, ]
    source = "../../Child_Module/Azure_nsg"
    nsg = var.nsg1
  
}

module "nic_nsg_association" {
  depends_on =[module.nic,module.nsg]
  source     = "../../Child_Module/Azure_association_group"
  nic_nsg_assoc = var.nic_nsg_assoc
  nic_ids       = module.nic.nic_ids
  nsg_ids       = module.nsg.nsg_ids
}


module "vms2" {
    depends_on = [module.rg1,module.nic,module.vnet] 
    source = "../../Child_Module/Azure_vm"
    vms = var.vms1
     nic_ids = module.nic.nic_ids
  
}
module "key_vault" {
    source = "../../Child_Module/Azure_key_vault"
    key_vault = var.key_vault
  
}

module "sql_server" {
    depends_on = [ module.rg1 ]
  source          = "../../Child_Module/Azure_Sql_Server"
  sql_server_name = "sql-dev-tinku"
  rg_name         = "tinku1"
  location        = "west us"
  admin_username  = "azureuser"
  admin_password  = "Password@123"
  tags            = {}
}

module "sql_db" {
  depends_on  = [module.sql_server]
  source      = "../../Child_Module/Azure_sql_database"
  sql_db_name = "sqldb-dev-todoapp"
  server_id   = module.sql_server.server_id
  max_size_gb = "2"
  tags        = {}
}
