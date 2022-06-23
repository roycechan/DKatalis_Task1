SELECT 
    datatable.priority AS priority,
    AVG (datatable.ser_exit - datatable.ser_start) AS average_service_time,
    COUNT(datatable.server) AS count
FROM crm_call_center_logs AS datatable
INNER JOIN crm_events on datatable.complaint_id = crm_events.complaint_id
GROUP BY priority
ORDER BY average_service_time DESC
;
