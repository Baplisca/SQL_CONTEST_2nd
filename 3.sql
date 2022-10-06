select
    a.PF_CODE as CODE,
    a.PF_NAME as NAME,
    a.PERCENTAGE
from
(
    select
        ROUND(TOTAL(case when d.CATEGORY_CODE = '120' then d.AMT else 0 end) * 100 / TOTAL(case when d.CATEGORY_CODE = '110' then d.AMT else 0 end), 1) as PERCENTAGE,
        p.PF_CODE,
        p.PF_NAME
    from
        PREFECTURE p
    inner join
        DRINK_HABITS d
    on
        p.PF_CODE = d.PF_CODE
    where
        d.GENDER_CODE = '2' or
        d.GENDER_CODE = '3'
    group by
        p.PF_CODE
) a
order by 
    a.PERCENTAGE desc,
    a.PF_CODE desc
;