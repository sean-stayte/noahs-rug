--CTE to show profit margins on all orders, and select for orders where Noah's lost money
WITH cte AS (
SELECT DISTINCT sub.orderid, SUM(sub.price_subtotal) AS price, SUM(sub.wholesale_subtotal) AS cost, (SUM(sub.price_subtotal) - SUM(sub.wholesale_subtotal)) AS profit
FROM (
	SELECT i.orderid, (i.qty*i.unit_price) AS price_subtotal, (i.qty*p.wholesale_cost) AS wholesale_subtotal
	FROM [noahs-orders_items] AS i
	LEFT JOIN [noahs-products] AS p
	ON i.sku = p.sku ) AS sub
GROUP BY orderid
HAVING (SUM(sub.price_subtotal) - SUM(sub.wholesale_subtotal)) < 0)

--Join customer data for each order to find number of customer who most often generated a negative profit margin
SELECT DISTINCT c.phone, COUNT(*)
FROM [noahs-customers] AS c
LEFT JOIN [noahs-orders] AS o
ON c.customerid = o.customerid
LEFT JOIN cte AS cte
ON o.orderid = cte.orderid
WHERE cte.profit IS NOT NULL
GROUP BY c.phone
ORDER BY COUNT(*) DESC;