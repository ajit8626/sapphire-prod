variable "resource_group_name" {
  description = "variable of the resource group"
}

variable "location" {
  description = "location of the resource group"
}

variable "azenv" {
  type = string
}

variable "eh_primarykey" {
}

variable "sb_primarykey" {
}

variable "stgaccnamestraminput" {
  description = "Storage account name for input to MissingSales streamanalytics"
}

variable "stgaccnamestraminputacckey" {
  description = "Access key of streamanalytics"
}

variable "stgacccontainername" {
  description = "Storage account container name"
}
variable "eh_listenaccesskey" {
  description = "EventHub listen access key"
}

