select if(isnull(pr.id), r.name, concat_ws(' - ', pr.name, r.name)) as combined_name, count(sr.mhl_suppliers_ID) as numsup from mhl_rubrieken r
left join mhl_rubrieken pr ON r.parent = pr.id
left join mhl_suppliers_mhl_rubriek_view as sr on r.id=sr.mhl_rubriek_view_ID
group by combined_name