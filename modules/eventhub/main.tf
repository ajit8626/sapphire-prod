resource "azurerm_eventhub_namespace" "main" {
  count                    = length(var.eventhubns)
  name                     = "${var.azenv}-${var.eventhubns[count.index]}"
  location                 = var.location
  resource_group_name      = var.resource_group_name
  sku                      = var.eventhubnssku
  capacity                 = var.eventhubnscapacity
  auto_inflate_enabled     = true
  maximum_throughput_units = 1
  tags = {
    environment = var.azenv
  }
}

# Below RootManageSharedAccessKey is created bydefault by Azue.
/*
 resource "azurerm_eventhub_namespace_authorization_rule" "root" {
   count = length(var.eventhubns)
   name = "RootManageSharedAccessKey"
   namespace_name = "${var.azenv}-${var.eventhubns[count.index]}"
   resource_group_name = var.resource_group_name
   listen = true
   send = true
   manage = true
   depends_on=[azurerm_eventhub_namespace.main]
 }
*/

resource "azurerm_eventhub_namespace_authorization_rule" "listen" {
  count               = length(var.eventhubns)
  name                = "ListenAccessKey"
  namespace_name      = "${var.azenv}-${var.eventhubns[count.index]}"
  resource_group_name = var.resource_group_name
  listen              = true
  send                = false
  manage              = false
  depends_on          = [azurerm_eventhub_namespace.main]
}

resource "azurerm_eventhub_namespace_authorization_rule" "send" {
  count               = length(var.eventhubns)
  name                = "SendPolicy"
  namespace_name      = "${var.azenv}-${var.eventhubns[count.index]}"
  resource_group_name = var.resource_group_name
  listen              = false
  send                = true
  manage              = false
  depends_on          = [azurerm_eventhub_namespace.main]
}

resource "azurerm_eventhub_namespace_authorization_rule" "duplex" {
  count               = length(var.eventhubns)
  name                = "DuplexPolicy"
  namespace_name      = "${var.azenv}-${var.eventhubns[count.index]}"
  resource_group_name = var.resource_group_name
  listen              = true
  send                = true
  manage              = false
  depends_on          = [azurerm_eventhub_namespace.main]
}

resource "azurerm_eventhub" "evth1ns3D" {
  count = length(var.eventhubs1_3D)
  name  = var.eventhubs1_3D[count.index]
  #prd-sap-evth eventhub
  namespace_name      = "${var.azenv}-${var.eventhubns[0]}"
  resource_group_name = var.resource_group_name
  partition_count     = 32
  message_retention   = 3
  depends_on          = [azurerm_eventhub_namespace.main]
}

resource "azurerm_eventhub" "evth1ns7D" {
  count = length(var.eventhubs1_7D)
  name  = var.eventhubs1_7D[count.index]
  #prd-sap-evth eventhub
  namespace_name      = "${var.azenv}-${var.eventhubns[0]}"
  resource_group_name = var.resource_group_name
  partition_count     = 32
  message_retention   = 3
  depends_on          = [azurerm_eventhub_namespace.main]
}

resource "azurerm_eventhub_consumer_group" "evth1ns_3D-cg" {
  count = length(var.eventhubs1_3D)
  name  = "${var.eventhubs1_3D[count.index]}processor"
  #stg-sap-evth eventhub
  namespace_name      = "${var.azenv}-${var.eventhubns[0]}"
  eventhub_name       = var.eventhubs1_3D[count.index]
  resource_group_name = var.resource_group_name
  depends_on          = [azurerm_eventhub.evth1ns3D]
}

resource "azurerm_eventhub_consumer_group" "evth1ns_7D-cg" {
  count = length(var.eventhubs1_7D)
  name  = "${var.eventhubs1_7D[count.index]}processor"
  #prd-sap-evth eventhub
  namespace_name      = "${var.azenv}-${var.eventhubns[0]}"
  eventhub_name       = var.eventhubs1_7D[count.index]
  resource_group_name = var.resource_group_name
  depends_on          = [azurerm_eventhub.evth1ns7D]
}

resource "azurerm_eventhub" "evth2ns" {
  count = length(var.eventhubs2)
  name  = var.eventhubs2[count.index]
  #prd-sap-evth2 eventhub
  namespace_name      = "${var.azenv}-${var.eventhubns[1]}"
  resource_group_name = var.resource_group_name
  partition_count     = 32
  message_retention   = 3
  depends_on          = [azurerm_eventhub_namespace.main]
}

resource "azurerm_eventhub_consumer_group" "evth2ns-cg" {
  count               = length(var.eventhubs2)
  name                = "${var.eventhubs2[count.index]}processor"
  namespace_name      = "${var.azenv}-${var.eventhubns[1]}"
  eventhub_name       = var.eventhubs2[count.index]
  resource_group_name = var.resource_group_name
  depends_on          = [azurerm_eventhub.evth2ns]
}
