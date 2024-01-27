--Initially I was trying to find people who had also bought a "jersey" 
--which I thought corresponded to the sweatshirt mentioned in the problem.
--But that was a red herring
SELECT DISTINCT name, COUNT(*), c.phone
FROM [noahs-orders] AS o
LEFT JOIN [noahs-orders_items] AS i
ON o.orderid = i.orderid
LEFT JOIN [noahs-products] AS p
ON i.sku = p.sku
LEFT JOIN [noahs-customers] AS c
ON o.customerid = c.customerid
WHERE [desc] LIKE '%Senior%' AND c.citystatezip LIKE 'Staten%'
GROUP BY name, phone
ORDER BY count(*) DESC;