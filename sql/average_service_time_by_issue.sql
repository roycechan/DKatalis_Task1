SELECT 
    crm_events.issue AS issue,
    AVG (datatable.ser_exit - datatable.ser_start) AS average_service_time,
    COUNT(crm_events.issue) AS count
FROM crm_call_center_logs AS datatable
INNER JOIN crm_events on datatable.complaint_id = crm_events.complaint_id
GROUP BY issue
ORDER BY COUNT(crm_events.issue) DESC
LIMIT 15
;
