select 
CASE 
	WHEN WEEKDAY(JOINDATE) = 0 THEN "Maandag"
	WHEN WEEKDAY(JOINDATE) = 1 THEN "Dinsdag"
	WHEN WEEKDAY(JOINDATE) = 2 THEN "Woensdag"
	WHEN WEEKDAY(JOINDATE) = 3 THEN "Donderdag"
	WHEN WEEKDAY(JOINDATE) = 4 THEN "Vrijdag"
	WHEN WEEKDAY(JOINDATE) = 5 THEN "Zaterdag"
	WHEN WEEKDAY(JOINDATE) = 6 THEN "Zondag"
END AS "Dag van de week",
count(id) as "Aantal aanmeldingen" FROM mhl_suppliers
GROUP BY WEEKDAY(joindate)