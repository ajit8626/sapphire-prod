azure_subscription_id = "5b8eff2b-9710-4a04-9c70-f8d43b6b5e10"
azure_client_id       = "0fa21970-504f-4204-a082-8c77e20d28b5"
azure_tenant_id       = "3d2d2b6f-061a-48b6-b4b3-9312d687e3a1"
azure_client_secret   = "5tUM1fi-Ru5VpPGj0E_70OUlwoL2LqE0-~"

azenv    = "aj"
location = "westeurope"

#rediscache 
redisacc      = ["sap-redis"]
rediscapacity = 2
redisfamily   = "C"
redissku      = "Standard"

# WebApp CORS Origins
allowed_origins = ["https://usermanagement.dataservices-pvn.doverfs.com"]

#Azure Datafactory VSTS Configuration
account_name    = "TestAccount"
branch_name     = "master"
project_name    = "Sapphire"
repository_name = "DataWarehouse"
root_folder     = "DataFactory"

#databricks
workspacename = "sap-databricks"
workspacetier = "standard"

#app config
appconfigsku = "free"

#app service plan
appserviceplan_tier     = "PremiumV2"
appserviceplan_size     = "P1V2"
appserviceplan_capacity = 2

#Keyvault 
keyvaultsku = "standard"

#SignalR
signalrsku          = "Standard_S1"
signalrcapacity     = 1
signalr_servicemode = "Serverless"

#Stream Analytics
stgaccnamestraminput       = "stgsapstorage"
stgaccnamestraminputacckey = "JXUfpbpB7K7RWjopdhpF24VQYcJMPmh5b6tt6xer0R3z4EpyPDKmnX9CVDOPDx6a8RCyAHFsV48DLn8sCMNEWQ=="
stgacccontainername        = "siteconfigs"

#Container Registry
containerregistry_sku = "Standard"

#Eventhub
eventhubns    = ["sap-evth", "sap-evth2"]
eventhubs1_3D = ["adjustedtankinventories", "atgconfigs", "detecteddeliveries", "latedata", "nozzleconfigs", "rollupevents"]
eventhubs1_7D = ["salestransactions", "tankinventories"]
eventhubs2    = ["buffered-real-time-rec-req", "interval-snapshots", "notifications", "real-time-rec-req", "realtime-stock-rec-snapshots"]

#ServiceBus
sbqpartition3Dttl               = ["feed-file-receipts", "inventorycontrolreportrequests", "pbireportsqueue", "regeneraterecrequest", "sapphireadapterfilesqueue", "sirrequests", "tankchartrequests"]
sbtopic                         = ["alerts", "confirmeddeliveries","dailyreconciliations", "dailytaskalerts", "dailytasks","notifications", "tankinventories"]
alertsubscription               = ["atgalerts", "continuousrecalerts", "dailyalerts", "dailytaskalerts", "datasubmissionalerts", "siralerts", "smartalerts"]
confimeddelieveriessubscription = ["factor", "pdi", "pdiconverter", "pdisubscription"]
dailyreconciliationssubscription = ["dailyalertgenerator", "evrmltrainer"]
dailytaskalertssubscription     = ["all"]
dailytaskssubscription          = ["drainback", "linevariance", "rollup", "tankleak"]
notificationssubscription = ["auraportalnotificationprocessor", "notificationprocessor"]
tankinventoriessubscription     = ["realtimealerts", "smartalerts"]
servicebussku                   = "Standard"

#IotHub
iothsku = "S1" 
iothcapacity = "1"

#Kubernetes
agents_size = "Standard_F8s_v2" 
agents_count = 10
aks_admin_username = "aksuser" 
kubernetes_version = "1.18.14" 
nodepoolsname = ["memoptnew", "memooptnew2"]
nodepoolvm_size    = ["Standard_E8s_v4", "Standard_D8s_v3"]


#Sir ML Server
#nsg-port-list = ["ssh", "http", "https", "ml_server_port"] 
#nsg-priority-list = ["1010", "1020", "1030", "1040"] 
#nsg-description-list = ["Allow SSH connection", "Allow Http connection", "Allow https connection", "Allow ml server port"] 
#nsg-destination-port-range-list = ["22", "80", "443", "12800"]
#admin_username = "wayne"

#cosmosDB
cosmosdboffertype = "Standard" 
cosmosdbkind = "GlobalDocumentDB" 
cosmosdbconsistency_level = "Session"
cosdb = ["Sapphire", "Sapphire2", "SiteExporter"]
#for sapphire DB
sapphiredb_dedicated = ["alerts", "confirmed-deliveries", "dailyrec-adjustmenthistory", "data-submission", "delivery-intervals", "detected-deliveries", "hourly-recs", "real-time-sales-recs", "real-time-stock-recs", "reconciled-deliveries", "reports", "sales-transactions", "sir", "siteconfig", "tank-inventories"]
sapphiredb_shared = ["inventory-control", "metercalibration", "mlmodelinfo", "tank-activity-intervals"]
sapphiredb_pkey_id = ["config", "leases", "notifications"]
sapphiredb_pkey_name = ["settings"]
#for SiteExplorter DB
siteexporter = ["ExportTriggerMessage", "leases", "OrganizationMapping", "SiteData"]
#Sapphire2
sapphire2_pkey_siteid_dedicated = ["absolute-quite-time", "daily-reconciliation-source", "inventory-control", "site-rollup"]
sapphire2_pkey_id_dedicated = ["aura-event-mapping", "aura-workflow", "leases"]
