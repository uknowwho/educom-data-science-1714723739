select r.name, s.name, s.straat, s.huisnr, s.postcode from mhl_suppliers as s
join mhl_suppliers_mhl_rubriek_view as sr on s.id=sr.mhl_suppliers_ID
join mhl_rubrieken as r on r.id=sr.mhl_rubriek_view_ID
left join mhl_rubrieken as pr on r.parent=pr.id
join mhl_cities as ci on s.city_ID=ci.id
WHERE ci.name="Amsterdam" AND (r.name="drank" or pr.name="drank")
