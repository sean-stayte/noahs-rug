SELECT cust.name, cust.phone
FROM [noahs-customers] AS cust
LEFT JOIN [noahs-orders] AS ord
ON cust.customerid = ord.customerid
LEFT JOIN [noahs-orders_items] AS items
ON ord.orderid = items.orderid
LEFT JOIN [noahs-products] as prods
ON items.sku = prods.sku
WHERE name LIKE 'J% P%' AND ordered LIKE '2017%' AND [desc] LIKE '%Bagel%';