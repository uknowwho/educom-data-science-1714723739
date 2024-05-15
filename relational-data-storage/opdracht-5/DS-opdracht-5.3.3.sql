select s.name, IFNULL(directie.functie, "t.a.v. de directie") as aanhef,  verzendlijst.adres, verzendlijst.postcode, verzendlijst.stad FROM verzendlijst
JOIN mhl_suppliers as s ON verzendlijst.id=s.id
LEFT JOIN directie ON s.id=directie.supplier_ID