variable "resource_group_name" {
  description = "variable of the resource group"
}

variable "location" {
  description = "location of the resource group"
}

variable "azenv" {}

variable "cosmosdboffertype" {
  description = "Cosmos DB offer type"
  default     = "Standard"
}

variable "cosmosdbkind" {
  description = "Cosmos DB kind"
  default     = "GlobalDocumentDB"
}

variable "cosmosdbconsistency_level" {
  description = "Cosmos DB consistency_level"
  default     = "Session"
}

variable "cosdb" {
  description = "cosmosDB names"
  type        = list(string)
}

variable "sapphiredb_dedicated" {
  description = "sapphiredb dedicated RU's list"
  type        = list(string)
}
variable "sapphiredb_shared" {
  description = "Sapphire DB shared RU's list"
  type        = list(string)
}
variable "sapphiredb_pkey_id" {
  description = "Sapphire DB dedicated RU's partiton key is '/id'"
  type        = list(string)
}

variable "sapphiredb_pkey_name" {
  description = "Sapphire DB dedicated RU's partition key is '/name'"
  type        = list(string)
}

variable "siteexporter" {
  description = "siteexporter DB collection lists"
  type        = list(string)
}

variable "sapphire2_pkey_siteid_dedicated" {
  description = "Sapphire2 DB pKey '/siteId' dedicated RU's"
  type        = list(string)
}

variable "sapphire2_pkey_id_dedicated" {
  description = "Sapphire2 DB pKey '/siteId' dedicated RU's"
  type        = list(string)
}

