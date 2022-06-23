SELECT 
    EXTRACT(HOUR FROM datatable.ser_start) AS hour_of_day,
    SUM(CASE WHEN datatable.server = 'BENSION' THEN 1 END) AS Bension,
    SUM(CASE WHEN datatable.server = 'ZOHARI' THEN 1 END) AS ZOHARI
FROM crm_call_center_logs AS datatable
INNER JOIN crm_events on datatable.complaint_id = crm_events.complaint_id
GROUP BY 1
ORDER BY 1
;


