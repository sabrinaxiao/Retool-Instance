-- Fetch orders from sabrina_customer_order_information filtered by optional delivery status and search term (name, email, or id).
SELECT id, name, email, delivery_status, address, product_id, amount_ordered
FROM sabrina_customer_order_information
WHERE ({{ !filterDeliveryStatus.value }} OR delivery_status = '{{ filterDeliveryStatus.value }}')
  AND (
    {{ !searchInput.value }}
    OR name ILIKE '%' || '{{ searchInput.value }}' || '%'
    OR email ILIKE '%' || '{{ searchInput.value }}' || '%'
    OR CAST(id AS TEXT) ILIKE '%' || '{{ searchInput.value }}' || '%'
  )
ORDER BY id DESC;