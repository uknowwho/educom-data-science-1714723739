CREATE VIEW Directie
AS
SELECT c.supplier_ID, c.name AS contact, d.name AS afdeling, c.contacttype as functie FROM mhl_contacts AS c
JOIN mhl_departments AS d ON c.department=d.id
WHERE c.contacttype="directie" OR c.contacttype LIKE "%directeur%"
ORDER BY c.supplier_ID asc 