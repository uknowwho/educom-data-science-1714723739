SELECT ci.name, IFNULL(co.name, "INVALID") FROM mhl_cities as ci
LEFT JOIN mhl_communes AS co ON ci.commune_ID=co.id