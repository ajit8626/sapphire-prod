resource "azurerm_servicebus_namespace" "main" {
  name                = "${var.azenv}-sap-svcb"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.servicebussku
}

# Below RootManageSharedAccessKey is created bydefault by Azue.
/* resource "azurerm_servicebus_namespace_authorization_rule" "root" {
  name = "RootManageSharedAccessKey"
  namespace_name = azurerm_servicebus_namespace.main.name
  resource_group_name = var.resource_group_name
  send = true
  listen = true
  manage = true
  depends_on=[azurerm_servicebus_namespace.main]
}
*/
resource "azurerm_servicebus_namespace_authorization_rule" "listen" {
  name                = "ListenAccessKey"
  namespace_name      = azurerm_servicebus_namespace.main.name
  resource_group_name = var.resource_group_name
  listen              = true
  send                = false
  manage              = false
  depends_on          = [azurerm_servicebus_namespace.main]
}

resource "azurerm_servicebus_namespace_authorization_rule" "send" {
  name                = "SendPolicy"
  namespace_name      = azurerm_servicebus_namespace.main.name
  resource_group_name = var.resource_group_name
  send                = true
  listen              = false
  manage              = false
  depends_on          = [azurerm_servicebus_namespace.main]
}

resource "azurerm_servicebus_namespace_authorization_rule" "duplex" {
  name                = "DuplexPolicy"
  namespace_name      = azurerm_servicebus_namespace.main.name
  resource_group_name = var.resource_group_name
  send                = true
  listen              = true
  manage              = false
  depends_on          = [azurerm_servicebus_namespace.main]
}

resource "azurerm_servicebus_namespace_authorization_rule" "flow" {
  name                = "FlowConnection"
  namespace_name      = azurerm_servicebus_namespace.main.name
  resource_group_name = var.resource_group_name
  send                = true
  listen              = true
  manage              = true
  depends_on          = [azurerm_servicebus_namespace.main]
}

resource "azurerm_servicebus_queue" "aura-timeout" {
  name                  = "aura-timeout"
  resource_group_name   = var.resource_group_name
  namespace_name        = azurerm_servicebus_namespace.main.name
  max_delivery_count    = 1000
  lock_duration         = "PT30S"
  max_size_in_megabytes = "5120"
  default_message_ttl   = "P14D"
  enable_partitioning   = true
  depends_on            = [azurerm_servicebus_namespace.main]
}

resource "azurerm_servicebus_queue" "TTL_3_days" {
  count                 = length(var.sbqpartition3Dttl)
  name                  = var.sbqpartition3Dttl[count.index]
  resource_group_name   = var.resource_group_name
  namespace_name        = azurerm_servicebus_namespace.main.name
  max_delivery_count    = 10
  lock_duration         = "PT30S"
  max_size_in_megabytes = "5120"
  default_message_ttl   = "P3D"
  enable_partitioning   = true
  depends_on            = [azurerm_servicebus_namespace.main]
}

resource "azurerm_servicebus_topic" "sbtopics" {
  count                 = length(var.sbtopic)
  name                  = var.sbtopic[count.index]
  resource_group_name   = var.resource_group_name
  namespace_name        = azurerm_servicebus_namespace.main.name
  enable_partitioning   = true
  status                = "Active"
  default_message_ttl   = "P3D"
  max_size_in_megabytes = "5120"
  depends_on            = [azurerm_servicebus_namespace.main]
}

resource "azurerm_servicebus_subscription" "alert-subsc" {
  count               = length(var.alertsubscription)
  name                = var.alertsubscription[count.index]
  resource_group_name = var.resource_group_name
  namespace_name      = azurerm_servicebus_namespace.main.name
  #alerts
  topic_name         = var.sbtopic[0]
  max_delivery_count = 10
  depends_on         = [azurerm_servicebus_topic.sbtopics]
}

resource "azurerm_servicebus_subscription" "confimeddelieveries-subsc" {
  count               = length(var.confimeddelieveriessubscription)
  name                = var.confimeddelieveriessubscription[count.index]
  resource_group_name = var.resource_group_name
  namespace_name      = azurerm_servicebus_namespace.main.name
  #confirmeddelieveries
  topic_name         = var.sbtopic[1]
  max_delivery_count = 10
  depends_on         = [azurerm_servicebus_topic.sbtopics]
}


resource "azurerm_servicebus_subscription" "dailyreconciliations-subsc" {
  count               = length(var.dailyreconciliationssubscription)
  name                = var.dailyreconciliationssubscription[count.index]
  resource_group_name = var.resource_group_name
  namespace_name      = azurerm_servicebus_namespace.main.name
  #dailyreconciliations
  topic_name         = var.sbtopic[2]
  max_delivery_count = 10
  depends_on         = [azurerm_servicebus_topic.sbtopics]
}


resource "azurerm_servicebus_subscription" "dailytaskalerts-subsc" {
  count               = length(var.dailytaskalertssubscription)
  name                = var.dailytaskalertssubscription[count.index]
  resource_group_name = var.resource_group_name
  namespace_name      = azurerm_servicebus_namespace.main.name
  #dailytaskalerts
  topic_name         = var.sbtopic[3]
  max_delivery_count = 10
  depends_on         = [azurerm_servicebus_topic.sbtopics]
}

resource "azurerm_servicebus_subscription" "dailytasks-subsc" {
  count               = length(var.dailytaskssubscription)
  name                = var.dailytaskssubscription[count.index]
  resource_group_name = var.resource_group_name
  namespace_name      = azurerm_servicebus_namespace.main.name
  #dailytasks
  topic_name         = var.sbtopic[4]
  max_delivery_count = 10
  depends_on         = [azurerm_servicebus_topic.sbtopics]
}
resource "azurerm_servicebus_subscription" "notifications-subsc" {
  count               = length(var.notificationssubscription)
  name                = var.notificationssubscription[count.index]
  resource_group_name = var.resource_group_name
  namespace_name      = azurerm_servicebus_namespace.main.name
  #notifications
  topic_name         = var.sbtopic[5]
  max_delivery_count = 3
  depends_on         = [azurerm_servicebus_topic.sbtopics]
}


resource "azurerm_servicebus_subscription" "tankinventories-subsc" {
  count               = length(var.tankinventoriessubscription)
  name                = var.tankinventoriessubscription[count.index]
  resource_group_name = var.resource_group_name
  namespace_name      = azurerm_servicebus_namespace.main.name
  #tankinventories
  topic_name         = var.sbtopic[6]
  max_delivery_count = 10
  depends_on         = [azurerm_servicebus_topic.sbtopics]
}

