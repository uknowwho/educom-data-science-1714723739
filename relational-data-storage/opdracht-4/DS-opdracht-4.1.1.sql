SELECT s.name, s.straat, s.huisnr, s.postcode FROM mhl_suppliers as s
JOIN mhl_cities as c ON c.id=s.city_ID
WHERE c.name = "Amsterdam"