resource "azurerm_stream_analytics_job" "main" {
  name                = "MissingSales"
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
	With LastInWindow as
	(
		select
			max(endTime) as endTime,
			siteId
			from
			realtimerecreq TIMESTAMP BY endTime 
			WHERE tag = 'SalesTransaction'
			group by
			siteId,
			tumblingwindow(hour, 1)
	),
	sites as
	(
		select
			count(*),
			event.siteId as siteId,
			DATENAME (weekday, System.Timestamp) as selectedDay,
			CASE WHEN DATENAME (weekday, System.Timestamp) = 'Sunday' THEN event.openingAndClosingTime.Sunday.endTime
				WHEN DATENAME (weekday, System.Timestamp) = 'Monday' THEN event.openingAndClosingTime.Monday.endTime
				WHEN DATENAME (weekday, System.Timestamp) = 'Tuesday' THEN event.openingAndClosingTime.Tuesday.endTime
				WHEN DATENAME (weekday, System.Timestamp) = 'Wednesday' THEN event.openingAndClosingTime.Wednesday.endTime
				WHEN DATENAME (weekday, System.Timestamp) = 'Thursday' THEN event.openingAndClosingTime.Thursday.endTime
				WHEN DATENAME (weekday, System.Timestamp) = 'Friday' THEN event.openingAndClosingTime.Friday.endTime
			ELSE event.openingAndClosingTime.Saturday.endTime END as openingclosingEndTime,
			CASE WHEN DATENAME (weekday, System.Timestamp) = 'Sunday' THEN event.openingAndClosingTime.Sunday.startTime
				WHEN DATENAME (weekday, System.Timestamp) = 'Monday' THEN event.openingAndClosingTime.Monday.startTime
				WHEN DATENAME (weekday, System.Timestamp) = 'Tuesday' THEN event.openingAndClosingTime.Tuesday.startTime
				WHEN DATENAME (weekday, System.Timestamp) = 'Wednesday' THEN event.openingAndClosingTime.Wednesday.startTime
				WHEN DATENAME (weekday, System.Timestamp) = 'Thursday' THEN event.openingAndClosingTime.Thursday.startTime
				WHEN DATENAME (weekday, System.Timestamp) = 'Friday' THEN event.openingAndClosingTime.Friday.startTime
			ELSE event.openingAndClosingTime.Saturday.startTime END as openingclosingStartTime
			from siteconfigs as event
			group by
			event.siteId,
			event.openingAndClosingTime,
			TumblingWindow(hour, 1)
	)
	select
		'continuousrecalerts' as label,
		max(I2.endTime) as lastMessageTime,
		System.Timestamp as checkTime,
		I1.siteId,
		I1.openingclosingEndTime as storeClose,
		I1.openingclosingStartTime as storeOpen,
		'ContinuousRec' as alertCategory,
		'MissingSales' as alertType
		into alerttopic
		from sites I1
		left join LastInWindow I2
		on I1.siteId = I2.siteId AND DATEDIFF(hour,I1,I2) BETWEEN 0 AND 1
		group by
		I1.siteId,
		I1.openingclosingEndTime,
		I1.openingclosingStartTime,
		tumblingwindow(hour, 1)
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

