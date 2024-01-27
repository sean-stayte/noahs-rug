--Only one person has ever bought the Noah's Ark model. 
--So that will be the only person who has the complete set.
SELECT DISTINCT p.[desc], COUNT(*)
FROM [noahs-orders] AS o
LEFT JOIN [noahs-orders_items] AS i
ON o.orderid = i.orderid
LEFT JOIN [noahs-products] AS p
ON i.sku = p.sku
LEFT JOIN [noahs-customers] AS c
ON o.customerid = c.customerid
WHERE i.sku LIKE 'COL%'
GROUP BY p.[desc]
ORDER BY COUNT(*);

SELECT c.name, c.phone
FROM [noahs-orders] AS o
LEFT JOIN [noahs-orders_items] AS i
ON o.orderid = i.orderid
LEFT JOIN [noahs-products] AS p
ON i.sku = p.sku
LEFT JOIN [noahs-customers] AS c
ON o.customerid = c.customerid
WHERE p.[desc] LIKE '%Ark Model%';