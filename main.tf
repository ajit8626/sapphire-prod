terraform {
  backend "azurerm" {
    storage_account_name = "tfstateacc"
    container_name       = "terraform"
    key                  = "tfstate-dxwetstock-prod"
	access_key = "Tuj6W6qw3tS1U8hj0K3tKW3HOwqSwdrYPK6ibjNcnx9R0DwKYQFH1fs4q2ugmgm7uVr7HTagr8bDkDeHQDtTZQ=="
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
module "servicebus" {
  source                                         = "./modules/servicebus"
  azenv                                          = var.azenv
  resource_group_name                            = azurerm_resource_group.main.name
  location                                       = azurerm_resource_group.main.location
  sbqpartition3Dttl                              = var.sbqpartition3Dttl
  sbqpartition14Dttl                             = var.sbqpartition14Dttl
  sbtopics                                       = var.sbtopics
  sbtopicalertssubscription                      = var.sbtopicalertssubscription
  sbtopictankinventoriessubscription10675199Dttl = var.sbtopictankinventoriessubscription10675199Dttl
  sbtopictankinventoriessubscription14Dttl       = var.sbtopictankinventoriessubscription14Dttl
  sbtopicconfirmeddeliveriessubscription         = var.sbtopicconfirmeddeliveriessubscription
  sbtopicdailytaskalertssubscription             = var.sbtopicdailytaskalertssubscription
  sbtopicdailytaskssubscription                  = var.sbtopicdailytaskssubscription
  sbtopicrollupssubscription                     = var.sbtopicrollupssubscription
  servicebussku                                  = var.servicebussku
}

module "signalr" {
  source              = "./modules/signalr"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  azenv               = var.azenv
  signalrsku          = var.signalrsku
  signalrcapacity     = var.signalrcapacity
  signalr_servicemode = var.signalr_servicemode
}

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
  #  log_analytics_workspace_id      = module.log_analytics_workspace.id
}

module "appinsights" {
  source              = "./modules/appinsights"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  azenv               = var.azenv
}

module "storage" {
  source                        = "./modules/storage"
  location                      = azurerm_resource_group.main.location
  resource_group_name           = azurerm_resource_group.main.name
  azenv                         = var.azenv
  storageaccounts               = var.storageaccounts
  storagecontainerssapbloblease = var.storagecontainerssapbloblease
  stgsapstoragecontainers       = var.stgsapstoragecontainers
  sapstoragetables              = var.sapstoragetables
  sapfunctionstoragecontainers  = var.sapfunctionstoragecontainers
  sapfunctionstoragetables      = var.sapfunctionstoragetables
  sapfunctionstoragequeues      = var.sapfunctionstoragequeues
}

module "storage-dataLake" {
  source              = "./modules/storage-dataLake"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  azenv               = var.azenv
  stgacctier          = var.stgacctier
  stgreplicationtype  = var.stgreplicationtype
  stgacckind          = var.stgacckind
  stgaccess_tier      = var.stgaccess_tier
}

module "eventhub" {
  source                     = "./modules/eventhub"
  azenv                      = var.azenv
  resource_group_name        = azurerm_resource_group.main.name
  location                   = azurerm_resource_group.main.location
  eventhubns                 = var.eventhubns
  eventhubs1                 = var.eventhubs1
  eventhubs2                 = var.eventhubs2
  reconciliationsconsumergrp = var.reconciliationsconsumergrp
  real-time-rec-req-consgrp  = var.real-time-rec-req-consgrp
  eventhubnssku              = var.eventhubnssku
  eventhubnscapacity         = var.eventhubnscapacity
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

module "streamanalytics" {
  source              = "./modules/streamanalytics"
  azenv               = var.azenv
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  eh_primarykey       = module.eventhub.eh_primarykey
  sb_primarykey       = module.servicebus.sb_primarykey
 	eh_listenaccesskey = module.eventhub.eh_listenaccesskey
    stgacccontainername = var.stgacccontainername
    stgaccnamestraminput  = var.stgaccnamestraminput 
    stgaccnamestraminputacckey  = var.stgaccnamestraminputacckey 
	eh_duplexpolicykey = module.eventhub.eh_duplexpolicykey

}

module "cosmosdb" {
  source                    = "./modules/cosmosdb"
  resource_group_name       = azurerm_resource_group.main.name
  location                  = azurerm_resource_group.main.location
  azenv                     = var.azenv
  azure_subscription_id     = var.azure_subscription_id
  azure_client_id           = var.azure_client_id
  azure_tenant_id           = var.azure_tenant_id
  azure_client_secret       = var.azure_client_secret
  cosmosdboffertype         = var.cosmosdboffertype
  cosmosdbkind              = var.cosmosdbkind
  cosmosdbconsistency_level = var.cosmosdbconsistency_level
}

module "databricks" {
  source              = "./modules/databricks"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  azenv               = var.azenv
  workspacename       = var.azenv-var.workspacename
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

module "iothub" {
  source                = "./modules/iothub"
  resource_group_name   = azurerm_resource_group.main.name
  location              = azurerm_resource_group.main.location
  azenv                 = var.azenv
  azure_subscription_id = var.azure_subscription_id
  azure_client_id       = var.azure_client_id
  azure_tenant_id       = var.azure_tenant_id
  azure_client_secret   = var.azure_client_secret
  evth1ns               = module.eventhub.evth1ns
  iothsku               = var.iothsku
  iothcapacity          = var.iothcapacity
}

module "datawarehouse" {
  source                = "./modules/datawarehouse"
  resource_group_name   = azurerm_resource_group.main.name
  location              = azurerm_resource_group.main.location
  azenv                 = var.azenv
  start_ipadd_list      = var.start_ipadd_list
  end_ipaddr_list       = var.end_ipaddr_list
  firewall_rule_name    = var.firewall_rule_name
  azure_subscription_id = var.azure_subscription_id
  azure_client_id       = var.azure_client_id
  azure_tenant_id       = var.azure_tenant_id
  azure_client_secret   = var.azure_client_secret
  sql_version           = var.sql_version
}


module "vm-sirml" {
  source                          = "./modules/vm-sirml"
  resource_group_name             = azurerm_resource_group.main.name
  location                        = azurerm_resource_group.main.location
  azenv                           = var.azenv
  nsg-port-list                   = var.nsg-port-list
  nsg-priority-list               = var.nsg-priority-list
  nsg-description-list            = var.nsg-description-list
  nsg-destination-port-range-list = var.nsg-destination-port-range-list
  admin_username                  = var.admin_username
  azure_subscription_id           = var.azure_subscription_id
  azure_client_id                 = var.azure_client_id
  azure_tenant_id                 = var.azure_tenant_id
  azure_client_secret             = var.azure_client_secret
}
*/