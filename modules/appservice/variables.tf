variable "resource_group_name" {
  description = "variable of the resource group"
}
variable "location" {
  description = "location of the resource group"
}
variable "azenv" {
  type = string
}
variable "allowed_origins" {
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
