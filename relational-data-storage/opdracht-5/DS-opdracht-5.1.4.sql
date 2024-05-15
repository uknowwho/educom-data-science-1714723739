SELECT s.name, sum(hitcount) AS numhits, count(hitcount) AS nummonths, avg(hitcount) AS avgpermonth FROM mhl_hitcount AS h
JOIN mhl_suppliers AS s ON h.supplier_ID=s.id
WHERE name="linera"
GROUP BY s.name