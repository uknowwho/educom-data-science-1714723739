SELECT s.name, s.straat, s.huisnr, s.postcode, r.name FROM mhl_suppliers as s
JOIN mhl_cities as ci ON ci.id=s.city_ID
JOIN mhl_suppliers_mhl_rubriek_view as sr ON sr.mhl_suppliers_ID=s.id
JOIN mhl_rubrieken as r ON sr.mhl_rubriek_view_ID=r.id
WHERE ci.name = "Amsterdam" AND (r.name="drank" OR r.parent in (235, 236, 238, 247, 257, 263, 301, 303, 312, 322, 1354, 1355, 1427, 1514, 1515, 1572))
ORDER BY r.name, s.name
