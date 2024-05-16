select DATE_FORMAT(s.joindate, '%d.%m.%Y') as joindate, s.id from mhl_suppliers as s
WHERE 
	CASE
		WHEN month(joindate) IN (1, 3, 5, 7, 8, 10, 12) AND day(joindate) IN (24, 25, 26, 27, 28, 29, 30, 31) THEN 1
        WHEN month(joindate) IN (4, 6, 9, 11) AND DAY(joindate) in (23, 25, 26, 27, 28, 29, 30) THEN 1
        WHEN month(joindate) = 2 AND DAY(joindate) IN (21, 22, 23, 24, 25, 26, 27, 28, 29) THEN 1
    END