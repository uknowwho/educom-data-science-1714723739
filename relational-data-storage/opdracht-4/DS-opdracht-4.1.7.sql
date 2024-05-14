SELECT 
    C1.name AS city1, 
    C2.name AS city2, 
    C1.id AS city1_id, 
    C2.id AS city2_id, 
    CO1.id AS commune_id1, 
    CO2.id AS commune_id2
FROM mhl_cities AS C1, mhl_cities AS C2
JOIN mhl_communes AS CO1 ON C2.commune_ID = CO1.id
JOIN mhl_communes AS CO2 ON C2.commune_ID = CO2.id
WHERE C1.name = C2.name AND NOT C1.id = C2.id
ORDER BY city1;