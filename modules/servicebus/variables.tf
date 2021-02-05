variable "resource_group_name" {
  description = "variable of the resource group"
}

variable "location" {
  description = "location of the resource group"
}

variable "azenv" {
  type = string
}
variable "servicebussku" {
  description = "SB tier"
  type        = string
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

