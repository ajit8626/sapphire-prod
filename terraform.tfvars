

azenv    = "prd"
location = "westeurope"

#ServiceBus
servicebussku = "Standard"

sbqpartition3Dttl  = ["dailydatarequests", "inventorycontrolreportrequests", "notifications", "pbireportsqueue", "regeneraterecrequest", "rolluptasks", "sapphireadapterfilesqueue", "sirrequests", "siteconfig-warehouse-requests", "siteconfiganomalies", "tankchartrequests"]
sbqpartition14Dttl = ["aura-timeout",  "feed-file-receipts", "stgsapbloblease", "stgsapfunctionstorage", "stgsapstorage"]

sbtopics = ["alerts", "confirmeddeliveries", "dailytaskalerts", "dailytasks", "rollups", "tankinventories"]

sbtopicalertssubscription                      = ["dailyalerts", "dailytaskalerts", "siralerts", "smartalerts", "datasubmissionalerts", "atgalerts", "continuousrecalerts"]
sbtopictankinventoriessubscription10675199Dttl = ["realtimealerts", "smartwater"]
sbtopictankinventoriessubscription14Dttl       = ["smartalerts"]

sbtopicconfirmeddeliveriessubscription = ["factor", "pdi", "pdiconverter", "pdisubscription"]
sbtopicdailytaskalertssubscription     = ["all"]
sbtopicdailytaskssubscription          = ["rollup", "tankleak", "drainback", "linevariance"]
sbtopicrollupssubscription             = ["rollups"]

#Kubernetes
#agents_size        = "Standard_F4s_v2"
#agents_count       = "10"
#aks_admin_username = "aksuser"
#kubernetes_version = "1.17.9"
#nodepoolsname      = ["cmpopt", "memoopt"]
#nodepoolvm_size    = ["Standard_DS2_v2", "Standard_E2s_v3"]

#storage account
storageaccounts               = ["sapbloblease", "sapstorage", "sapfunctionstorage"]
storagecontainerssapbloblease = ["atgconfigleases", "commconfig", "detecteddeliveries", "notifications", "nozzleconfigsc", "salestransactions", "tankinventories"]
stgsapstoragecontainers       = ["azure-confirmed-deliveries", "azure-filedataimport", "azure-sapphire-adapter", "azure-sapphire-adapter-unzipped", "azure-sirdatafiles", "daily-rec-csv", "detecteddeliveries", "menifest", "powerbireport", "siteconfigs"]
sapstoragetables              = ["atgalertscodedescription", "confirmeddeliverieslookup", "dataimportlookup", "inventorycontrolsettings", "TankChart", "tankchartlevel", "tankchartlevelpreview"]
sapfunctionstoragecontainers  = ["azure-webjobs-eventhub", "azure-webjobs-hosts", "confirmeddeliveryhub-leases", "dailytaskprocessorhub-leases", "dataimportprocessorhub-leases", "powerbiprocessorhub-applease", "powerbiprocessorhub-leases", "realtimereconciliationprocessorhub-largemessages", "realtimereconciliationprocessorhub-leases", "regeneraterecprocessorhub-largemessages", "regeneraterecprocessorhub-leases", "sapphireadapterhub-leases", "tankchartbuilderhub-largemessages", "tankchartbuilderhub-leases", "testhubname-applease", "testhubname-leases", "warehousesiteconfighub-applease", "warehousesiteconfighub-largemessages", "warehousesiteconfighub-leases"]
sapfunctionstoragetables      = ["ConfirmedDeliveryHubHistory", "ConfirmedDeliveryHubInstances", "DailyTaskProcessorHubHistory", "DailyTaskProcessorHubInstances", "DataImportProcessorHubHistory", "DataImportProcessorHubInstances", "PowerBIProcessorHubHistory", "PowerBIProcessorHubInstances", "RealTimeReconciliationProcessorHubHistory", "RealTimeReconciliationProcessorHubInstances", "RegenerateRecProcessorHubHistory", "RegenerateRecProcessorHubInstances", "SapphireAdapterHubHistory", "SapphireAdapterHubInstances", "TankChartBuilderHubHistory", "TankChartBuilderHubInstances", "TestHubNameHistory", "TestHubNameInstances", "WarehouseSiteConfigHubHistory", "WarehouseSiteConfigHubInstances"]
sapfunctionstoragequeues      = ["azure-webjobs-blobtrigger-confirmeddeliveryprocessor54dfbb", "azure-webjobs-blobtrigger-confirmeddeliveryprocessor58f84c", "azure-webjobs-blobtrigger-confirmeddeliveryprocessor6fc868", "azure-webjobs-blobtrigger-confirmeddeliveryprocessor779b9b", "azure-webjobs-blobtrigger-confirmeddeliveryprocessor9d6645", "azure-webjobs-blobtrigger-dataimportprocessor569fc5489c9dk", "confirmeddeliveryhub-control-00", "confirmeddeliveryhub-control-01", "confirmeddeliveryhub-control-02", "confirmeddeliveryhub-control-03", "confirmeddeliveryhub-workitems", "dailytaskprocessorhub-control-00", "dailytaskprocessorhub-control-01", "dailytaskprocessorhub-control-02", "dailytaskprocessorhub-control-03", "dailytaskprocessorhub-workitems", "dataimportprocessorhub-control-00", "dataimportprocessorhub-control-01", "dataimportprocessorhub-control-02", "dataimportprocessorhub-control-03", "dataimportprocessorhub-workitems", "powerbiprocessorhub-control-00", "powerbiprocessorhub-control-01", "powerbiprocessorhub-control-02", "powerbiprocessorhub-control-03", "powerbiprocessorhub-workitems", "realtimereconciliationprocessorhub-control-00", "realtimereconciliationprocessorhub-control-01", "realtimereconciliationprocessorhub-control-02", "realtimereconciliationprocessorhub-control-03", "realtimereconciliationprocessorhub-workitems", "regeneraterecprocessorhub-control-00", "regeneraterecprocessorhub-control-01", "regeneraterecprocessorhub-control-02", "regeneraterecprocessorhub-control-03", "regeneraterecprocessorhub-workitems", "sapphireadapterhub-control-00", "sapphireadapterhub-control-01", "sapphireadapterhub-control-02", "sapphireadapterhub-control-03", "sapphireadapterhub-workitems", "tankchartbuilderhub-control-00", "tankchartbuilderhub-control-01", "tankchartbuilderhub-control-02", "tankchartbuilderhub-control-03", "tankchartbuilderhub-workitems", "testhubname-control-00", "testhubname-control-01", "testhubname-control-02", "testhubname-control-03", "testhubname-workitems", "warehousesiteconfighub-control-00", "warehousesiteconfighub-control-01", "warehousesiteconfighub-control-02", "warehousesiteconfighub-control-03", "warehousesiteconfighub-workitems"]

#Eventhub
eventhubns                 = ["sap-evth", "sap-evth2"]
eventhubs1                 = ["adjustedtankinventories", "atgconfigs", "detecteddeliveries", "devicecommconfigs", "latedata", "nozzleconfigs", "reconciliations", "rollupevents", "salestransactions", "tankinventories"]
eventhubs2                 = ["alerts", "buffered-real-time-rec-req", "bufferedrecrequesteventhub", "interval-snapshots", "notifications", "real-time-rec-req", "realtime-stock-rec-snapshots"]
reconciliationsconsumergrp = ["evrmlmodeltrainer", "notifications"]
real-time-rec-req-consgrp  = ["real-time-rec-req-missingsales-sa", "real-time-rec-req-missingstock-sa"]
eventhubnssku              = "Standard"
eventhubnscapacity         = 1

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

#Azure DataWarehouse Firewall Rules
start_ipadd_list   = ["0.0.0.0", "85.115.52.0", "217.37.201.145", "81.137.30.129", "81.150.209.81", "81.150.205.97", "81.128.183.164", "213.120.94.100"]
end_ipaddr_list    = ["0.0.0.0", "85.115.52.255", "217.37.201.145", "81.137.30.129", "81.150.209.81", "81.150.205.97", "81.128.183.164", "213.120.94.100"]
firewall_rule_name = ["AllowAllWindowsAzureIps", "Fairbanks Analysts", "FB ADSL 1", "FB ADSL 2", "FB ADSL 3", "FB ADSL 4", "FB LPool BT NET", "FB SKem BT NET"]

#Sir ML Server
nsg-port-list                   = ["ssh", "http", "https", "ml_server_port"]
nsg-priority-list               = ["1010", "1020", "1030", "1040"]
nsg-description-list            = ["Allow SSH connection", "Allow Http connection", "Allow https connection", "Allow ml server port"]
nsg-destination-port-range-list = ["22", "80", "443", "12800"]
admin_username                  = "wayne"

#app config
appconfigsku = "free"

#app service plan
appserviceplan_tier     = "Premium"
appserviceplan_size     = "V2"
appserviceplan_capacity = 1

#cosmosDB
cosmosdboffertype         = "Standard"
cosmosdbkind              = "GlobalDocumentDB"
cosmosdbconsistency_level = "Session"

#datawarehouse
sql_version = "12.0"
sql-admin-user = "dfssa"
sql-admin-password = "Ch@ng3M3"
adadmin = "Sapphire Operations"
adadminID = "c9b91080-425d-4e06-b432-f63cc5661435"

#ioth
iothsku      = "S1"
iothcapacity = "1"

#Keyvault 
keyvaultsku = "standard"

#SignalR
signalrsku          = "Standard_S1"
signalrcapacity     = 1
signalr_servicemode = "Serverless"

#storage-datalake
stgacctier         = "Standard"
stgreplicationtype = "RAGZRS"
stgacckind         = "StorageV2"
stgaccess_tier     = "Hot"

#Stream Analytics
stgaccnamestraminput = "stgsapstorage"
stgaccnamestraminputacckey = "JXUfpbpB7K7RWjopdhpF24VQYcJMPmh5b6tt6xer0R3z4EpyPDKmnX9CVDOPDx6a8RCyAHFsV48DLn8sCMNEWQ=="
stgacccontainername = "siteconfigs"
