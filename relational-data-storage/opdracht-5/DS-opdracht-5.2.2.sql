select ci.name,
sum(case 
	WHEN m.name="Gold" THEN 1
    ELSE 0 END) as gold,
sum(case 
	WHEN m.name="Silver" THEN 1
    ELSE 0 END) as silver,
sum(case 
	WHEN m.name="Bronze" THEN 1
    ELSE 0 END) as bronze,
sum(case 
	WHEN m.name not in ("Gold", "Silver", "Bronze") THEN 1
    ELSE 0 END) as other
from mhl_suppliers as s
join mhl_cities as ci on ci.id=s.city_ID
join mhl_membertypes as m on s.membertype=m.id
group by city_ID
order by gold desc, silver desc, bronze desc, other desc 