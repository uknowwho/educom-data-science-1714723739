select s.name,
CASE
	WHEN p_address = '' THEN CONCAT(straat, " ", huisnr)
	WHEN p_address LIKE '_%' THEN p_address
END AS adres,
CASE
	WHEN c.name LIKE "_%" THEN CONCAT("t.a.v. ", c.name)
	WHEN c.name = "" THEN "t.a.v. de directie"
    WHEN c.name IS NULL THEN "t.a.v. de directie"
END AS aanhef,
s.postcode, ci.name AS plaats, co.name AS gemeente
from mhl_contacts as c
right join mhl_suppliers as s on s.id=c.supplier_ID
join mhl_cities as ci on s.city_ID=ci.id
join mhl_communes as co on ci.commune_ID=co.id
ORDER BY co.name, ci.name, c.name