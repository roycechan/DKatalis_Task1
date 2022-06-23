SELECT 
    crm_events.company_response_to_consumer AS company_response_to_consumer,
    AVG(CASE WHEN consumer_disputed = 'Yes' THEN datatable.ser_exit - datatable.ser_start END) AS disputed_average_service_time,
    AVG(CASE WHEN consumer_disputed = 'No' THEN datatable.ser_exit - datatable.ser_start END) AS not_disputed_average_service_time,
    COUNT(CASE WHEN consumer_disputed = 'Yes' THEN datatable.ser_exit END) AS disputed,
    COUNT(CASE WHEN consumer_disputed = 'No' THEN datatable.ser_exit END) AS not_disputed
FROM crm_call_center_logs AS datatable
INNER JOIN crm_events on datatable.complaint_id = crm_events.complaint_id
GROUP BY company_response_to_consumer
ORDER BY not_disputed_average_service_time
LIMIT 5

;
