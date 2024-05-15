select year,
SUM(case
when h.month < 4 then h.hitcount else 0 end) as "Eerste Kwartaal",
SUM(case
when h.month in (4,5,6) then h.hitcount else 0 end) as "Tweede Kwartaal",
SUM(case
when h.month in (7,8,9) then h.hitcount else 0 end) as "Derde Kwartaal",
SUM(case
when h.month > 9 then h.hitcount else 0 end) as "Vierde Kwartaal",
sum(h.hitcount) as totaal
from mhl_hitcount as h
group by h.year