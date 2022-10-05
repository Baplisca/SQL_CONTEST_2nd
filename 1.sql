update
    POPULATION
set
    DISTRICT_NAME = '不明'
where
    DISTRICT_NAME is null or
    DISTRICT_NAME = ''
;