select s.joindate, s.id, DATEDIFF(CURRENT_DATE(), joindate) as days_in from mhl_suppliers as s
ORDER BY days_in ASC