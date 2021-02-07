Resource - Stream Analytics
name - "MissingStock"
stream_analytics_stream_input_eventhub -"realtimerecreq"
						eventhubname - "realtimerecreq"
stream_analytics_stream_input_blob - "stgsapstorage"
			storage_container_name - "stgsapstorage"
stream_analytics_output_servicebus_topic - alerttopic
						servicebus_topic_name - alerttopic