variable "resource_group_name" {
  description = "variable of the resource group"
}
variable "location" {
  description = "location of the resource group"
}
variable "azenv" {
  type = string
}
variable "azure_subscription_id" {}
variable "evth1ns" {}

variable "iothsku" {
  description = "IOT HUB sku"
  default     = "S1"
}

variable "iothcapacity" {
  description = "IOT HUB capacity"
  default     = "1"
}
