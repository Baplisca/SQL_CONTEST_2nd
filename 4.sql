select
    t.SURVEY_YEAR as SV_YEAR,
    P.PF_NAME as PREFECTURE,
    t.KIND,
    t.AMT
from
(   
    select
        SURVEY_YEAR,
        PF_CODE,
        '小学校' as KIND,
        SUM(ELEMENTARY) as AMT,
        1 as TYPE
    from
        ENROLLMENT_STATUS
    group by
        SURVEY_YEAR,
        PF_CODE
    union
    select
        SURVEY_YEAR,
        PF_CODE,
        '中学校' as KIND,
        SUM(MIDDLE) as AMT,
        2 as TYPE
    from
        ENROLLMENT_STATUS
    group by
        SURVEY_YEAR,
        PF_CODE
    union
    select
        SURVEY_YEAR,
        PF_CODE,
        '高校' as KIND,
        SUM(HIGH) as AMT,
        3 as TYPE
    from
        ENROLLMENT_STATUS
    group by
        SURVEY_YEAR,
        PF_CODE
    union
    select
        SURVEY_YEAR,
        PF_CODE,
        '短大' as KIND,
        SUM(JUNIOR_CLG) as AMT,
        4 as TYPE
    from
        ENROLLMENT_STATUS
    group by
        SURVEY_YEAR,
        PF_CODE
    union
    select
        SURVEY_YEAR,
        PF_CODE,
        '大学' as KIND,
        SUM(COLLEGE) as AMT,
        5 as TYPE
    from
        ENROLLMENT_STATUS
    group by
        SURVEY_YEAR,
        PF_CODE
    union
    select
        SURVEY_YEAR,
        PF_CODE,
        '大学院' as KIND,
        SUM(GRADUATE) as AMT,
        6 as TYPE
    from
        ENROLLMENT_STATUS
    group by
        SURVEY_YEAR,
        PF_CODE
)t
inner join
    PREFECTURE p
on
    t.PF_CODE = p.PF_CODE
where
    t.AMT is not null and
    t.SURVEY_YEAR = '2020'
order by
    t.PF_CODE,
    t.TYPE
;