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

variable "eh_listenaccesskey" {
	description = "EventHub listen access key"
}
variable "stgacccontainername" {
	description = "Storage account name for streamanalytics input"
}

variable "stgaccnamestraminputacckey" {
	description = "Access key of streamanalytics"
}

variable "eh_duplexpolicykey" {
	description = "EventHub duplex policy key"
}
