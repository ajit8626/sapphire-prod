resource "azurerm_stream_analytics_job" "main" {
  name                = "Sales-Stock-Buffer"
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
	WITH SiteData AS
	(
		SELECT siteId,Collect() as sData
		FROM realtimerecreq
		GROUP BY siteId,TumblingWindow(minute,10)
	)
	SELECT s.siteId,UDF.getStocks(s.sData) as TankInventories,
	UDF.getSales(s.sData) as SalesTransaction
	FROM SiteData s
  QUERY
}

resource "azurerm_stream_analytics_stream_input_eventhub" "ldinput1" {
  name                         = "realtimerecreq"
  stream_analytics_job_name    = azurerm_stream_analytics_job.main.name
  resource_group_name          = var.resource_group_name
  servicebus_namespace         = "${var.azenv}-sap-evth2"
  eventhub_name                = "real-time-rec-req"
  eventhub_consumer_group_name = "real-time-rec-req-missingsales-sa"
  shared_access_policy_key     = var.eh_duplexpolicykey
  shared_access_policy_name    = "DuplexPolicy"

  serialization {
    type     = "Json"
    encoding = "UTF8"
  }
}

resource "azurerm_stream_analytics_output_eventhub" "ldoutput" {
  name                      = "buffered-real-time-rec-req"
  stream_analytics_job_name = azurerm_stream_analytics_job.main.name
  resource_group_name       = var.resource_group_name
  eventhub_name             = "buffered-real-time-rec-req"
  servicebus_namespace      = "${var.azenv}-sap-evth2"
  shared_access_policy_key  = var.eh_duplexpolicykey
  shared_access_policy_name = "DuplexPolicy"
  
  serialization {
    type     = "Json"
    encoding = "UTF8"
	format = "Array"
  }
}