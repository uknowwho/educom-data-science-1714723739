SELECT * FROM mhl_suppliers as s
JOIN pc_lat_long as pc ON pc.pc6=s.postcode
ORDER BY lat DESC
LIMIT 5
