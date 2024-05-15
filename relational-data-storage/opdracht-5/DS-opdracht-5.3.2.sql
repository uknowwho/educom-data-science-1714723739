CREATE VIEW verzendlijst
AS
SELECT s.id,
CASE
	WHEN s.p_address != "" THEN s.p_address
    ELSE concat(s.straat, " ", huisnr)
END AS adres,
CASE 
	WHEN s.p_address != "" THEN p_postcode
    ELSE postcode
END AS postcode,
CASE 
	WHEN s.p_address != "" THEN ci2.name
    ELSE ci.name
END AS stad
FROM mhl_suppliers as s
JOIN mhl_cities as ci ON s.city_ID=ci.id
JOIN mhl_cities as ci2 ON s.p_city_ID=ci2.id
ORDER BY s.id asc