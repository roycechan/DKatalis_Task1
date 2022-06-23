SELECT 
    crm_events.tags AS tags,
    crm_events.issue AS issues,
    crm_events.company_response_to_consumer AS company_response_to_consumer,
    AVG (datatable.ser_exit - datatable.ser_start) AS average_service_time,
    COUNT(crm_events.issue) AS count
FROM crm_call_center_logs AS datatable
INNER JOIN crm_events on datatable.complaint_id = crm_events.complaint_id
WHERE tags IS NULL
GROUP BY 1,2,3
ORDER BY COUNT(crm_events.issue) DESC
LIMIT 20
;
