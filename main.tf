terraform {
  backend "azurerm" {
    storage_account_name = "terraformbackend01"
    container_name       = "terraform"
    key                  = "tfstate-dxwetstock-prod"
    access_key           = "okcb+8+l4ywiAVjYthPsypoaDSgwNEkSM1JKIFzqdQ/Co1B/73cNSl2y366s8ip+Id2wEi85c8ziXbbYoUDOJw=="
  }
}


resource "azurerm_resource_group" "main" {
  name     = "${var.azenv}-sap-paas-rg"
  location = var.location
  tags = {
    environment = var.azenv
  }
}
/*
module "signalr" {
  source              = "./modules/signalr"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  azenv               = var.azenv
  signalrsku          = var.signalrsku
  signalrcapacity     = var.signalrcapacity
  signalr_servicemode = var.signalr_servicemode
}

module "appinsights" {
  source              = "./modules/appinsights"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  azenv               = var.azenv
}

module "rediscache" {
  source              = "./modules/rediscache"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  azenv               = var.azenv
  redisacc            = var.redisacc
  rediscapacity       = var.rediscapacity
  redisfamily         = var.redisfamily
  redissku            = var.redissku
}

module "appconfig" {
  source              = "./modules/appconfig"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  azenv               = var.azenv
  appconfigsku        = var.appconfigsku
}

module "keyvault" {
  source              = "./modules/keyvault"
  azenv               = var.azenv
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  azure_tenant_id     = var.azure_tenant_id
  keyvaultsku         = var.keyvaultsku
}

module "streamanalytics" {
  source                     = "./modules/streamanalytics"
  azenv                      = var.azenv
  resource_group_name        = azurerm_resource_group.main.name
  location                   = azurerm_resource_group.main.location
  eh_primarykey              = module.eventhub.eh_primarykey
  sb_primarykey              = module.servicebus.sb_primarykey
  eh_listenaccesskey         = module.eventhub.eh_listenaccesskey
  stgacccontainername        = var.stgacccontainername
  stgaccnamestraminput       = var.stgaccnamestraminput
  stgaccnamestraminputacckey = var.stgaccnamestraminputacckey
  eh_duplexpolicykey         = module.eventhub.eh_duplexpolicykey

}

module "databricks" {
  source              = "./modules/databricks"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  azenv               = var.azenv
  workspacename       = var.workspacename
  workspacetier       = var.workspacetier
}

module "datafactory" {
  source              = "./modules/datafactory"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  azenv               = var.azenv
  account_name        = var.account_name
  branch_name         = var.branch_name
  project_name        = var.project_name
  repository_name     = var.repository_name
  root_folder         = var.root_folder
  azure_tenant_id     = var.azure_tenant_id
}


module "appservice" {
  source                  = "./modules/appservice"
  resource_group_name     = azurerm_resource_group.main.name
  location                = azurerm_resource_group.main.location
  azenv                   = var.azenv
  allowed_origins         = var.allowed_origins
  appserviceplan_tier     = var.appserviceplan_tier
  appserviceplan_size     = var.appserviceplan_size
  appserviceplan_capacity = var.appserviceplan_capacity
}


module "containerregisrty" {
  source                = "./modules/containerregisrty"
  resource_group_name   = azurerm_resource_group.main.name
  location              = azurerm_resource_group.main.location
  azenv                 = var.azenv
  containerregistry_sku = var.containerregistry_sku
}

*/
module "eventhub" {
  source              = "./modules/eventhub"
  azenv               = var.azenv
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  eventhubns          = var.eventhubns
  eventhubs1_3D       = var.eventhubs1_3D
  eventhubs1_7D       = var.eventhubs1_7D
  eventhubs2          = var.eventhubs2
  eventhubnssku       = var.eventhubnssku
  eventhubnscapacity  = var.eventhubnscapacity
}

/*
module "servicebus" {
  source                           = "./modules/servicebus"
  azenv                            = var.azenv
  resource_group_name              = azurerm_resource_group.main.name
  location                         = azurerm_resource_group.main.location
  sbqpartition3Dttl                = var.sbqpartition3Dttl
  sbtopic                          = var.sbtopic
  alertsubscription                = var.alertsubscription
  confimeddelieveriessubscription  = var.confimeddelieveriessubscription
  dailytaskalertssubscription      = var.dailytaskalertssubscription
  dailytaskssubscription           = var.dailytaskssubscription
  tankinventoriessubscription      = var.tankinventoriessubscription
  dailyreconciliationssubscription = var.dailyreconciliationssubscription
  notificationssubscription        = var.notificationssubscription
  servicebussku                    = var.servicebussku
}

*/
module "iothub" {
  source                = "./modules/iothub"
  resource_group_name   = azurerm_resource_group.main.name
  location              = azurerm_resource_group.main.location
  azenv                 = var.azenv
  azure_subscription_id = var.azure_subscription_id
  evth1ns               = module.eventhub.evth1ns
  iothsku               = var.iothsku
  iothcapacity          = var.iothcapacity
}
/*
module "aks" {
  source              = "./modules/aks"
  azenv               = var.azenv
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  aks_admin_username  = var.aks_admin_username
  agents_size         = var.agents_size
  agents_count        = var.agents_count
  kubernetes_version  = var.kubernetes_version
  azure_client_id     = var.azure_client_id
  azure_client_secret = var.azure_client_secret
  nodepoolsname       = var.nodepoolsname
  nodepoolvm_size     = var.nodepoolvm_size
}

module "vm-sirml" {
  source = "./modules/vm-sirml" 
  resource_group_name = azurerm_resource_group.main.name
  location = azurerm_resource_group.main.location
  azenv = var.azenv
  nsg-port-list = var.nsg-port-list
  nsg-priority-list = var.nsg-priority-list
  nsg-description-list = var.nsg-description-list
  nsg-destination-port-range-list = var.nsg-destination-port-range-list
  admin_username = var.admin_username
  azure_subscription_id = var.azure_subscription_id
  azure_client_id = var.azure_client_id
  azure_tenant_id = var.azure_tenant_id
  azure_client_secret = var.azure_client_secret
}
*/
