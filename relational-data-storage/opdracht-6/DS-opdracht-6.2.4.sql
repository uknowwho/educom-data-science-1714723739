select YEAR(joindate) as jaar, MONTHNAME(joindate) as maand, count(id) as aantal FROM mhl_suppliers
GROUP BY YEAR(joindate), MONTH(joindate)