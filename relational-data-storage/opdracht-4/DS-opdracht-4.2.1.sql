SELECT ci.commune_ID, ci.name FROM mhl_cities as ci
LEFT JOIN mhl_communes AS co ON ci.commune_ID=co.id
WHERE co.name IS NULL