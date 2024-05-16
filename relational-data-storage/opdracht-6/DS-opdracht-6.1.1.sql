select  year as jaar, 
CASE 
	WHEN month=1 THEN "Januari"
    WHEN month=2 THEN "Februari"
    when month=3 THEN "Maart"
	WHEN month=4 THEN "April"
    WHEN month=5 THEN "Mei"
    when month=6 THEN "Juni"
	WHEN month=7 THEN "Juli"
    WHEN month=8 THEN "Augustus"
    when month=9 THEN "September"
	WHEN month=10 THEN "Oktober"
    WHEN month=11 THEN "November"
    when month=12 THEN "December"
END as maand,
count(distinct(supplier_ID)) as "aantal_leveranciers", sum(hitcount) as "totaal aantal hits" from mhl_hitcount
group by year, month
order by jaar desc, maand