variable "resource_group_name" {
  description = "variable of the resource group"
}
variable "location" {
  description = "location of the resource group"
}
variable "azenv" {
  type = string
}
variable "admin_username" {
  description = "Sirml vm admin username"
  default     = "wayne"
}
variable "nsg-port-list" {
  description = "NSG port list"
}
variable "nsg-priority-list" {
  description = "NSG priority list"
}

variable "nsg-description-list" {
  description = "NSG descriptions"
  type        = list(string)
}
variable "nsg-destination-port-range-list" {
  description = "NSG port list"
}
variable "azure_client_id" {}
variable "azure_client_secret" {}
variable "azure_subscription_id" {}
variable "azure_tenant_id" {}
