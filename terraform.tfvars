

azenv    = "aj"
location = "westeurope"

#rediscache 
#redisacc      = ["sap-redis"]
#rediscapacity = 2
#redisfamily   = "C"
#redissku      = "Standard"

# WebApp CORS Origins
allowed_origins = ["https://usermanagement.dataservices-pvn.doverfs.com"]

#Azure Datafactory VSTS Configuration
#account_name    = "TestAccount"
#branch_name     = "master"
#project_name    = "Sapphire"
#repository_name = "DataWarehouse"
#root_folder     = "DataFactory"

#databricks
#workspacename = "sap-databricks"
#workspacetier = "standard"

#app config
#appconfigsku = "free"

#app service plan
appserviceplan_tier     = "PremiumV2"
appserviceplan_size     = "P1V2"
appserviceplan_capacity = 2

#Keyvault 
#keyvaultsku = "standard"

#SignalR
#signalrsku          = "Standard_S1"
#signalrcapacity     = 1
#signalr_servicemode = "Serverless"

#Stream Analytics
#stgaccnamestraminput       = "stgsapstorage"
#stgaccnamestraminputacckey = "JXUfpbpB7K7RWjopdhpF24VQYcJMPmh5b6tt6xer0R3z4EpyPDKmnX9CVDOPDx6a8RCyAHFsV48DLn8sCMNEWQ=="
#stgacccontainername        = "siteconfigs"

#Container Registry
containerregistry_sku = "Standard"

#Eventhub
eventhubns = ["sap-evth", "sap-evth2"]
eventhubs1_3D = ["adjustedtankinventories", "atgconfigs", "detecteddeliveries", "latedata", "nozzleconfigs", "rollupevents"]
eventhubs1_7D = ["salestransactions", "tankinventories"]
eventhubs2 = ["buffered-real-time-rec-req", "interval-snapshots", "notifications", "real-time-rec-req", "realtime-stock-rec-snapshots"]

#ServiceBus
sbqpartition3Dttl = ["feed-file-receipts", "inventorycontrolreportrequests", "notifications", "pbireportsqueue", "regeneraterecrequest", "sapphireadapterfilesqueue", "sirrequests", "tankchartrequests"]
sbtopic = ["alerts", "confirmeddeliveries", "dailytaskalerts", "dailytasks", "tankinventories"]
alertsubscription = ["atgalerts", "continuousrecalerts", "dailyalerts", "dailytaskalerts", "datasubmissionalerts", "siralerts", "smartalerts"]
confimeddelieveriessubscription = ["factor", "pdi", "pdiconverter", "pdisubscription"]
dailytaskalertssubscription = ["all"]
dailytaskssubscription = ["drainback", "linevariance", "rollup", "tankleak"]
tankinventoriessubscription = ["realtimealerts", "smartalerts"]
servicebussku = "Standard"
