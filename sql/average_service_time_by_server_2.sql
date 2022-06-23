SELECT 
    crm_events.company_response_to_consumer AS company_response_to_consumer,
    COUNT(CASE WHEN datatable.server = 'BENSION' THEN datatable.server END) AS Bension,
    COUNT(CASE WHEN datatable.server = 'ZOHARI' THEN datatable.server END) AS Zohari
FROM crm_call_center_logs AS datatable
INNER JOIN crm_events on datatable.complaint_id = crm_events.complaint_id
GROUP BY company_response_to_consumer
ORDER BY Bension DESC

;


