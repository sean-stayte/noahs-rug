SELECT 
		name,
		phone
FROM [noahs-customers]
WHERE RIGHT(REPLACE((TRANSLATE(name,'abcdefghijklmnopqrstuvwxyz','22233344455566677778889999')),' ',''),10) = REPLACE(phone,'-','');