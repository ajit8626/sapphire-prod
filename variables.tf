variable "azure_client_id" {}

variable "azure_client_secret" {}

variable "azure_subscription_id" {}

variable "azure_tenant_id" {}

variable "azenv" {
  type = string
}
variable "appconfigsku" {
  description = "App config SKU"
}

variable "location" {
  description = "location of the resource group"
  default     = "westeurope"
}

variable "signalrsku" {
  description = "SignalR SKU"
  default     = "Standard_S1"
}

variable "signalrcapacity" {
  description = "SignalR Capacity"
  default     = 1
}

variable "signalr_servicemode" {
  description = "SignalR Service Mode"
  default     = "Serverless"
}

variable "workspacetier" {
  description = "Workspace Tier for azure databricks service"
  default     = "Standard"
}

variable "workspacename" {
  description = "Databricks Workspace Name"
}


variable "containerregistry_sku" {
  description = "Container Registry SKU"
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


variable "appserviceplan_tier" {
  description = "App Service Plan Tier"
}

variable "appserviceplan_size" {
  description = "App Service Plan Size"
}

variable "keyvaultsku" {
  description = "Keyvault sku"
  default     = "standard"
}

variable "appserviceplan_capacity" {
  description = "App Service Plan Capacity"
}

variable "allowed_origins" {
  description = "WebApp CORS origins"
}


variable "eventhubns" {
  description = "These are the list of eventhub namespaces."
  type        = list(string)
}

variable "eventhubs1_3D" {
  description = "This is the list of eventhubs in the first EH namespace."
  type        = list(string)
}

variable "eventhubnssku" {
  description = "Eventhub Namespace SKU"
  default     = "Standard"
}
variable "eventhubnscapacity" {
  description = "Eventhub Namespace Capacity"
  default     = 1
}

variable "eventhubs1_7D" {
  description = "This is the list of eventhubs in the first EH namespace."
  type        = list(string)
}

variable "eventhubs2" {
  description = "This is the list of eventhubs in the second EH namespace."
  type        = list(string)
}

variable "sbqpartition3Dttl" {
  description = "SB Queues 3D time to live list"
  type        = list(string)
}

variable "sbtopic" {
  description = "SB topics list"
  type        = list(string)
}

variable "alertsubscription" {
  description = "SB Topics subscription list"
  type        = list(string)
}

variable "confimeddelieveriessubscription" {
  description = "SB Topics subscription list"
  type        = list(string)
}

variable "dailytaskalertssubscription" {
  description = "SB Topics subscription list"
  type        = list(string)
}

variable "dailytaskssubscription" {
  description = "SB Topics subscription list"
  type        = list(string)
}

variable "tankinventoriessubscription" {
  description = "SB Topics subscription list"
  type        = list(string)
}

variable "dailyreconciliationssubscription" {
  description = "SB Topics subscription list"
  type        = list(string)
}

variable "notificationssubscription" {
  description = "SB Topics subscription list"
  type        = list(string)
}

variable "servicebussku" {
  description = "SB tier"
  type        = string
}

variable "iothsku" {
  description = "IotHub SKU"
  type        = string
}

variable "iothcapacity" {
  description = "IOTHUB capacity"
}

variable "agents_size" {
  default     = "Standard_DS2_v2"
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

variable "agents_count" {
  default     = "1"
  description = "The default virtual machine size for the Kubernetes agents"
}

variable "redisacc" {
  description = "Redis Cache Account Names"
}

variable "rediscapacity" {
  description = "Redis Cache Capacity"
  default     = 2
}

variable "redisfamily" {
  description = "Redis Cache Family"
  default     = "C"
}

variable "redissku" {
  description = "Redis Cache SKU"
  default     = "Standard"
}


variable "stgaccnamestraminput" {
  description = "Storage account name for input to MissingSales streamanalytics"
}

variable "stgacccontainername" {
  description = "Storage account name for streamanalytics input"
}

variable "stgaccnamestraminputacckey" {
  description = "Access key of streamanalytics"
}

variable "cosmosdboffertype" {
  description = "Cosmos DB offer type"
  default = "Standard"
}

variable "cosmosdbkind" {
  description = "Cosmos DB kind"
  default = "GlobalDocumentDB"
}

variable "cosmosdbconsistency_level" {
  description = "Cosmos DB consistency_level"
  default = "Session"
}


variable "cosdb" {
  description = "cosmosDB names"
  type = list(string)
}

variable "sapphiredb_dedicated" {
  description = "sapphiredb dedicated RU's list"
  type = list(string)
}

variable "sapphiredb_shared" {
  description = "Sapphire DB shared RU's list"
  type = list(string)
}

variable "sapphiredb_pkey_id" {
  description = "Sapphire DB dedicated RU's partiton key is '/id'"
  type = list(string)
}
variable "sapphiredb_pkey_name" {
  description = "Sapphire DB dedicated RU's partition key is '/name'"
  type = list(string)
}

variable "siteexporter" {
  description = "siteexporter DB collection lists"
  type = list(string)
}

variable "sapphire2_pkey_siteid_dedicated" {
  description = "Sapphire2 DB pKey '/siteId' dedicated RU's"
  type = list(string)
}
variable "sapphire2_pkey_id_dedicated" {
  description = "Sapphire2 DB pKey '/siteId' dedicated RU's"
  type = list(string)
}
