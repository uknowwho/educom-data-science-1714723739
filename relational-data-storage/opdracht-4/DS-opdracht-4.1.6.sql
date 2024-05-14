SELECT h.hitcount, s.name AS leverancier, ci.name AS stad, co.name AS gemeente, di.name AS provincie FROM mhl_hitcount AS h
JOIN mhl_suppliers AS s ON s.id=h.supplier_ID
JOIN mhl_cities AS ci ON s.city_ID=ci.id
JOIN mhl_communes AS co ON ci.commune_ID=co.id
JOIN mhl_districts AS di ON co.district_ID=di.id
WHERE month = 1 AND year = 2014 AND di.name IN ("Limburg", "Noord-Brabant")