SELECT DISTINCT "Department Id",COUNT(*) 
FROM BCA_COMMON.REGIMP_VW 
WHERE "Property Id" = '03129059' AND "Roll Year" = 2018
GROUP BY "Department Id"  