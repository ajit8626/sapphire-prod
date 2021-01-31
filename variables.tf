variable "azure_client_id" {}

variable "azure_client_secret" {}

variable "azure_subscription_id" {}

variable "azure_tenant_id" {}

variable "azenv" {
  type = string
}

variable "location" {
  description = "location of the resource group"
  default     = "westeurope"
}

variable "sbqpartition3Dttl" {
  description = "These are the list of servicebus queues with partition 3D TTL."
  type        = list(string)
}

variable "sbqpartition14Dttl" {
  description = "These are the list of servicebus queues with partition 14D TTL."
  type        = list(string)
}


variable "sbtopics" {
  description = "These are the list of servicebus topics."
  type        = list(string)
}

variable "sbtopicalertssubscription" {
  description = "These are the list of servicebus alerts topic subscriptions."
  type        = list(string)
}

variable "sbtopictankinventoriessubscription10675199Dttl" {
  description = "These are the list of servicebus tankinventories topic subscription."
  type        = list(string)
}

variable "sbtopictankinventoriessubscription14Dttl" {
  description = "These are the list of servicebus tankinventories topic subscription."
  type        = list(string)
}

variable "sbtopicconfirmeddeliveriessubscription" {
  description = "These are the list of servicebus cconfirmeddeliveries topic subscription."
  type        = list(string)
}


variable "sbtopicdailytaskalertssubscription" {
  description = "These are the list of servicebus dailytasksalerts topic subscription."
  type        = list(string)
}

variable "sbtopicdailytaskssubscription" {
  description = "These are the list of servicebus dailytasks topic subscription."
  type        = list(string)
}

variable "sbtopicrollupssubscription" {
  description = "These are the list of servicebus rollups topic subscription."
  type        = list(string)
}

variable "agents_size" {
  default     = "Standard_DS2_v2"
  description = "The default virtual machine size for the Kubernetes agents"
}

variable "agents_count" {
  default     = "15"
  description = "The default virtual machine size for the Kubernetes agents"
}

variable "aks_admin_username" {
  default     = "aksuser"
  description = "The username of the local administrator to be created on the Kubernetes cluster"
}

variable "kubernetes_version" {}

variable "nodepoolsname" {
  description = "Additional Node pool Name"
  type        = list(string)
}

variable "nodepoolvm_size" {
  description = "Additional nodepools vm_size"
  type        = list(string)
}

variable "storageaccounts" {
  description = "Storage Account names"
  type        = list(string)
}

variable "storagecontainerssapbloblease" {
  description = "Storage sapbloblease containers"
  type        = list(string)
}

variable "stgsapstoragecontainers" {
  description = "Storage sapstorage containres"
  type        = list(string)
}

variable "sapstoragetables" {
  description = "Storage sapstoragetables tables"
  type        = list(string)
}

variable "sapfunctionstoragecontainers" {
  description = "Storage sapfunctionstoragecontainers container"
  type        = list(string)
}

variable "sapfunctionstoragetables" {
  description = "Storage sapfunctionstoragetables tables"
  type        = list(string)
}

variable "account_replication_name" {
  description = "Defines the type of replication to use for this storage account."
  default     = "LRS"
}

variable "account_tier_name" {
  description = "Defines the Tier to use for this storage account."
  default     = "Standard"
}

variable "sapfunctionstoragequeues" {
  description = "sapfunctionstorage queues"
  type        = list(string)
}

variable "eventhubns" {
  description = "These are the list of eventhub namespaces."
  type        = list(string)
}

variable "eventhubs1" {
  description = "This is the list of eventhubs in the first EH namespace."
  type        = list(string)
}

variable "eventhubs2" {
  description = "This is the list of eventhubs in the second EH namespace."
  type        = list(string)
}

variable "reconciliationsconsumergrp" {
  description = "This is the list of EH-1 consumergroup in the first EH namespace."
  type        = list(string)
}

variable "real-time-rec-req-consgrp" {
  description = "This is the list of EH-2 consumergroup in the first EH namespace."
  type        = list(string)
}
variable "redisacc" {
  description = "Redis Cache Account Names"
}
variable "allowed_origins" {
  description = "WebApp CORS origins"
}

variable "workspacename" {
  description = "Databricks Workspace Name"
}
variable "account_name" {
  type        = string
  description = "Azure DevOps Account Name"

}

variable "branch_name" {
  type        = string
  description = "Azure DevOps Git Branch Name"
}

variable "root_folder" {
  type        = string
  description = "Folder in Azure DevOps Git Branch"
}

variable "project_name" {
  type        = string
  description = "Azure DevOps Proejct Name in Azure DevOps Account"
}

variable "repository_name" {
  type        = string
  description = "Git Repository Name in Azure DevOps"
}


variable "sql-admin-user" {
  description = "admin user name for sql datawarehouse server"
  default     = "dfssa"
}
variable "sql-admin-password" {
  description = "admin password for sql datawarehouse server"
  default     = "Ch@ng3M3"
}
variable "adadmin" {
  description = "admin user name for sql datawarehouse server"
  default     = "Sapphire Operations"
}
variable "adadminID" {
  description = "Active Directory Admin ID"
  default     = "c9b91080-425d-4e06-b432-f63cc5661435"
}

variable "start_ipadd_list" {
}

variable "end_ipaddr_list" {
}

variable "firewall_rule_name" {
}

variable "admin_username" {
  description = "Sirml vm admin username"
  default     = "wayne"
}

variable "nsg-port-list" {}

variable "nsg-priority-list" {}

variable "nsg-description-list" {}

variable "nsg-destination-port-range-list" {}

variable "appconfigsku" {
  description = "App config SKU"
}

variable "appserviceplan_tier" {
  description = "App Service Plan Tier"
}

variable "appserviceplan_size" {
  description = "App Service Plan Size"
}

variable "appserviceplan_capacity" {
  description = "App Service Plan Capacity"
}

variable "cosmosdboffertype" {
  description = "Cosmos DB offer type"
}

variable "cosmosdbkind" {
  description = "Cosmos DB kind"
}

variable "cosmosdbconsistency_level" {
  description = "Cosmos DB consistency_level"
}

variable "workspacetier" {
  description = "Workspace Tier for azure databricks service"
}

variable "sql_version" {
  description = "SQL version"
}

variable "iothsku" {
  description = "IOT HUB sku"
}

variable "iothcapacity" {
  description = "IOT HUB capacity"
}

variable "keyvaultsku" {
  description = "Keyvault sku"
}

variable "rediscapacity" {
  description = "Redis Cache Capacity"
}

variable "redisfamily" {
  description = "Redis Cache Family"
}

variable "redissku" {
  description = "Redis Cache SKU"
}

variable "signalrsku" {
  description = "SignalR SKU"
}

variable "signalrcapacity" {
  description = "SignalR Capacity"
}

variable "signalr_servicemode" {
  description = "SignalR Service Mode"
}

variable "stgacctier" {
  description = "Storage account tier"
}

variable "stgreplicationtype" {
  description = "Storage account replication type"
}

variable "stgacckind" {
  description = "Storage Account Kind"
}

variable "stgaccess_tier" {
  description = "Storage Account access tier"
}

variable "servicebussku" {
  description = "Service bus namespace sku"
}

variable "eventhubnssku" {
  description = "Eventhub Namespace SKU"
}

variable "eventhubnscapacity" {
  description = "Eventhub Namespace Capacity"
}


variable "stgaccnamestraminput" {
	description = "Storage account name for input to MissingSales streamanalytics"
}


variable "stgacccontainername" {
	description = "Storage account container name for streamanalytics"
}

variable "stgaccnamestraminputacckey" {
	description = "Storage account access key"
}

