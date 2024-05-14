SELECT s.name, s.straat, s.huisnr, s.postcode FROM mhl_suppliers as s
JOIN mhl_yn_properties as p ON p.supplier_ID=s.id
JOIN mhl_propertytypes as pt ON p.propertytype_ID=pt.id
WHERE pt.name in ("specialistische leverancier", "ook voor particulieren")
