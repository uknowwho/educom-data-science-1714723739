-- Ik snap niet waarom we de absolute hitcount met een gemiddelde vergelijken. 
-- Ook is het niet mogelijk om in deze query het gemiddelde per leverancier met het gemiddelde per gemeente te vergelijken+filteren in de where clause, geen idee waarom. 
SELECT 
    co.name AS gemeente, 
    s.name,
    SUM(h.hitcount) AS total_hitcount,
    gemeente_avg.avg_hitcount AS gemeente_avg_hitcount,
    h.hitcount
FROM 
    mhl_communes AS co
JOIN 
    mhl_cities AS ci ON co.id = ci.commune_id
JOIN 
    mhl_suppliers AS s ON ci.id = s.city_ID
JOIN 
    mhl_hitcount AS h ON s.id = h.supplier_ID
JOIN 
	mhl_districts AS di ON co.district_ID = di.id
JOIN 
	mhl_countries AS cn ON di.country_ID = cn.id
JOIN 
    (SELECT 
         co.id AS gemeente_id, 
         AVG(h.hitcount) AS avg_hitcount
     FROM 
         mhl_communes AS co
     JOIN 
         mhl_cities AS ci ON co.id = ci.commune_id
     JOIN 
         mhl_suppliers AS s ON ci.id = s.city_ID
     JOIN 
         mhl_hitcount AS h ON s.id = h.supplier_ID
     JOIN 
         mhl_districts AS di ON co.district_ID = di.id
     JOIN 
         mhl_countries AS cn ON di.country_ID = cn.id
     WHERE 
         cn.name = "Nederland"
     GROUP BY 
         co.id) AS gemeente_avg ON co.id = gemeente_avg.gemeente_id
WHERE cn.name = "Nederland"
GROUP BY 
    co.id, s.id
HAVING total_hitcount > gemeente_avg.avg_hitcount
-- het aftrekken van het gemiddelde is een monotonische operatie dus is weggelaten
ORDER BY gemeente, total_hitcount desc
