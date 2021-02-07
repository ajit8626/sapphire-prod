variable "resource_group_name" {
  description = "variable of the resource group"
}

variable "location" {
  description = "location of the resource group"
}

variable "azenv" {
  type = string
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