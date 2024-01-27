WITH baked AS (
SELECT CAST(o.ordered AS date) AS order_date, 
		CAST (o.ordered AS time) AS order_time, 
		p.sku, 
		c.name, 
		c.phone
FROM [noahs-orders] AS o
LEFT JOIN [noahs-orders_items] AS i
ON o.orderid = i.orderid
LEFT JOIN [noahs-products] AS p
ON i.sku = p.sku
LEFT JOIN [noahs-customers] AS c
ON o.customerid = c.customerid
WHERE p.sku LIKE 'BKY%' AND (CAST(o.ordered AS time)) < '05:00:00' )

SELECT DISTINCT name, phone, COUNT(*)
FROM baked
GROUP BY name, phone
ORDER BY count(*) DESC

