variable "resource_group_name" {
  description = "variable of the resource group"
}

variable "location" {
  description = "location of the resource group"
}

variable "azenv" {
  type = string
}

variable "eventhubns" {
  description = "These are the list of eventhub namespaces."
  type = list(string)
}

variable "eventhubs1_3D" {
  description = "This is the list of eventhubs in the first EH namespace."
  type = list(string)
}

variable "eventhubnssku" {
  description = "Eventhub Namespace SKU"
  default = "Standard"
}

variable "eventhubnscapacity" {
  description = "Eventhub Namespace Capacity"
  default = 1
}

variable "eventhubs1_7D" {
  description = "This is the list of eventhubs in the first EH namespace."
  type = list(string)
}

variable "eventhubs2" {
   description = "This is the list of eventhubs in the second EH namespace."
   type = list(string)
}

