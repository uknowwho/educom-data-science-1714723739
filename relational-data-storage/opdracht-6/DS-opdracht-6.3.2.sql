SELECT name, REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(name, "&Uuml;", "Ü"), "&uuml;", "ü"), "&ouml;", "ö"), "&euml;", "ë"), "&auml;", "ä") as nicename FROM mhl_suppliers
WHERE name LIKE "%&____;%"
limit 25