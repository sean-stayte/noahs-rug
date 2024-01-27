--How many times did Sherri buy an item that comes in several colours?
SELECT *
FROM [noahs-orders] AS o
LEFT JOIN [noahs-orders_items] AS i
ON o.orderid = i.orderid
LEFT JOIN [noahs-products] AS p
ON i.sku = p.sku
LEFT JOIN [noahs-customers] AS c
ON o.customerid = c.customerid
WHERE c.name = 'Sherri Long' AND p.[desc] LIKE '%(%)%';

--Seems like she only did that four times.
--It also seems logical that her ex would have bought the identical item (except for the colour) at almost the same time.
--So the order numbers should be very similar
--Check each order number in turn...
SELECT *
FROM [noahs-orders] AS o
LEFT JOIN [noahs-orders_items] AS i
ON o.orderid = i.orderid
LEFT JOIN [noahs-products] AS p
ON i.sku = p.sku
LEFT JOIN [noahs-customers] AS c
ON o.customerid = c.customerid
WHERE o.orderid LIKE '7050_';