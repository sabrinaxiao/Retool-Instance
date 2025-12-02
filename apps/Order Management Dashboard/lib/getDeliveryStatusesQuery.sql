-- Get distinct delivery_status values from sabrina_customer_order_information for populating delivery status dropdowns.
SELECT DISTINCT delivery_status
FROM sabrina_customer_order_information
WHERE delivery_status IS NOT NULL
ORDER BY delivery_status;