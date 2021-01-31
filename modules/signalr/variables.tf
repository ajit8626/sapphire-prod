variable "resource_group_name" {
  description = "variable of the resource group"
}

variable "location" {
  description = "location of the resource group"
}

variable "azenv" {
  type = string
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