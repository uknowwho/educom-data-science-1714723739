SELECT s.name, s.straat, s.huisnr, s.postcode, ci.name FROM mhl_suppliers as s
JOIN mhl_cities as ci ON ci.id=s.city_ID
JOIN mhl_communes as co ON co.id=ci.commune_ID
WHERE co.name="Steenwijkerland"