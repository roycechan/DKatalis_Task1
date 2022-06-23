SELECT 
    crm_events.issue AS issue,
    -- AVG(datatable.ser_exit - datatable.ser_start) AS average_service_time,
    COUNT(crm_events.issue) AS disputes
FROM crm_call_center_logs AS datatable
INNER JOIN crm_events on datatable.complaint_id = crm_events.complaint_id
WHERE crm_events.company_response_to_consumer = 'Closed without relief' AND crm_events.consumer_disputed = 'Yes'
GROUP BY 1
ORDER BY COUNT(crm_events.issue) DESC
LIMIT 10

;
