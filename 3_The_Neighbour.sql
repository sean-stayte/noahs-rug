SELECT name, phone
FROM [noahs-customers]
WHERE citystatezip LIKE 'Jamaica, NY 11435' AND
		(birthdate LIKE '1927-06%' OR
		birthdate LIKE '1927-07%' OR
		birthdate LIKE '1939-06%' OR
		birthdate LIKE '1939-07%' OR
		birthdate LIKE '1951-06%' OR
		birthdate LIKE '1951-07%' OR
		birthdate LIKE '1963-06%' OR
		birthdate LIKE '1963_07%' OR
		birthdate LIKE '1975-06%' OR
		birthdate LIKE '1975-07%' OR
		birthdate LIKE '1987-06%' OR 
		birthdate LIKE '1987-07%' OR
		birthdate LIKE '1999-06%' OR
		birthdate LIKE '1999-07%')
ORDER BY birthdate DESC;