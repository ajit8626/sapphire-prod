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


variable "appserviceplan_tier" {
  description = "App Service Plan Tier"
}

variable "appserviceplan_size" {
  description = "App Service Plan Size"
}

variable "appserviceplan_capacity" {
  description = "App Service Plan Capacity"
}

variable "allowed_origins" {
  description = "WebApp CORS origins"
}

variable "containerregistry_sku" {
  description = "Container Registry SKU"
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

variable "servicebussku" {
  description = "SB tier"
  type        = string
}

variable "iothsku" {
  description = "IotHub SKU"
  type = string
}

variable "iothcapacity" {
  description = "IOTHUB capacity"
}

variable "agents_size" {
  default = "Standard_DS2_v2"
  description = "The default virtual machine size for the Kubernetes agents"
}

variable "aks_admin_username" {
  default = "aksuser"
  description = "The username of the local administrator to be created on the Kubernetes cluster"
}

variable "kubernetes_version" {} 

variable "nodepoolsname" {
  description = "Additional Node pool Name"
  type = list(string)
}

variable "nodepoolvm_size" {
  description = "Additional nodepools vm_size"
  type = list(string)
}

variable "agents_count" {
  default = "1"
  description = "The default virtual machine size for the Kubernetes agents"
}