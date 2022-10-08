select
    DISTRICT_CODE as CODE,
    DISTRICT_NAME as NAME,
    TOTAL_AMT as TOTAL
from
    POPULATION
where
    TOTAL_AMT >= 100000 and
    DISTRICT_NAME like '%東%'
order by
    TOTAL_AMT desc,
    DISTRICT_CODE
;