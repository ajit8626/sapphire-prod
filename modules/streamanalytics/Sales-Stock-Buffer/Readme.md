Resource - Stream Analytics
name - "Sales-Stock-Buffer"
stream_analytics_stream_input_eventhub -"realtimerecreq"
						eventhubname - "realtimerecreq"

stream_analytics_output_eventhub - buffered-real-time-rec-req
						eventhubname - buffered-real-time-rec-req