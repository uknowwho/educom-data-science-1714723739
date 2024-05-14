SELECT r1.ID, r1.name AS hoofdrubriek, IFNULL(r2.name, "") AS subrubriek FROM mhl_rubrieken AS r1
LEFT JOIN mhl_rubrieken AS r2 ON r1.parent = r2.id
ORDER BY hoofdrubriek, subrubriek