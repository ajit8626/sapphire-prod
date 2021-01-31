resource "azurerm_stream_analytics_job" "main" {
  name                = "MissingStock"
  resource_group_name = var.resource_group_name
  location            = var.location
  compatibility_level = "1.1"

  # Actual compatibility_level set on portal - "1.2"
  #  compatibility_level                      = "1.2"
  events_late_arrival_max_delay_in_seconds = 5
  events_out_of_order_max_delay_in_seconds = 0
  events_out_of_order_policy               = "Adjust"
  output_error_policy                      = "Stop"
  streaming_units                          = 1

  tags = {
    environment = var.azenv
  }

  transformation_query = <<QUERY
	WITH LastInWindow AS
	(
		SELECT 
		MAX(endTime) AS endTime,
		entityId as tankId,
		siteId
		FROM 
		realtimerecreq TIMESTAMP BY endTime 
		WHERE tag = 'TankInventory'
		GROUP BY 
		entityId,
		siteId,
		TumblingWindow(hour, 1)
	),
	tanks AS
	(
	    SELECT
		count(*),
		event.siteId as siteId,
		tank.ArrayValue.id as tankId
		FROM siteconfigs as event CROSS APPLY getarrayelements(event.tanks) AS tank
		GROUP BY 
		tank.ArrayValue.id,
		event.siteId,
		TumblingWindow(hour, 1)
	)

	SELECT 
	'continuousrecalerts' as label,
	MAX(I2.endTime) as lastMessageTime,
	System.Timestamp as checkTime,
	I1.tankId as tankOrManifoldId,
	I1.siteId,
	'ContinuousRec' as alertCategory,
	'MissingLevel' as alertType
	INTO alerttopic
	FROM tanks I1  
	LEFT JOIN LastInWindow I2  
	ON I1.tankId = I2.tankId AND DATEDIFF(hour,I1,I2) BETWEEN 0 AND 1
	GROUP BY 
	I1.tankId,
	I1.siteId,
	TumblingWindow(hour, 1)
  QUERY
}

resource "azurerm_stream_analytics_stream_input_eventhub" "ldinput1" {
  name                         = "realtimerecreq"
  stream_analytics_job_name    = azurerm_stream_analytics_job.main.name
  resource_group_name          = var.resource_group_name
  servicebus_namespace         = "${var.azenv}-sap-evth2"
  eventhub_name                = "real-time-rec-req"
  eventhub_consumer_group_name = "real-time-rec-req-missingsales-sa"
  shared_access_policy_key     = var.eh_listenaccesskey
  shared_access_policy_name    = "ListenAccessKey"

  serialization {
    type     = "Json"
    encoding = "UTF8"
  }
}

resource "azurerm_stream_analytics_stream_input_blob" "ldinput2" {
  name                      = var.stgacccontainername 
  stream_analytics_job_name = azurerm_stream_analytics_job.main.name
  resource_group_name       = var.resource_group_name
  storage_account_name      = var.stgaccnamestraminput 
  storage_account_key       = var.stgaccnamestraminputacckey 
  storage_container_name    = var.stgacccontainername 
  path_pattern              = "{date}"
  date_format               = "yyyy/MM/dd"
  time_format               = "HH"

  serialization {
    type     = "Json"
    encoding = "UTF8"
  }
}

resource "azurerm_stream_analytics_output_servicebus_topic" "ldoutput" {
  name                      = "alerttopic"
  stream_analytics_job_name = azurerm_stream_analytics_job.main.name
  resource_group_name       = var.resource_group_name
  topic_name                = "alerts"
  servicebus_namespace      = "${var.azenv}-sap-svcb"
  shared_access_policy_key  = var.sb_primarykey
  shared_access_policy_name = "SendPolicy"

  serialization {
    format   = "LineSeparated"
    type     = "Json"
    encoding = "UTF8"
  }
}

