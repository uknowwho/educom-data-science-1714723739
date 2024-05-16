SELECT name, CONCAT(UPPER(substr(name, 1, 1)), SUBSTR(name, 2)) as nicename from mhl_cities
order by name